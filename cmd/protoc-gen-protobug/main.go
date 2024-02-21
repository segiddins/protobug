package main

import (
	"fmt"
	"path/filepath"
	"slices"
	"strings"

	"github.com/kr/text"
	. "github.com/segiddins/protobug/rubby"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
	"google.golang.org/protobuf/compiler/protogen"
	"google.golang.org/protobuf/encoding/prototext"
	"google.golang.org/protobuf/reflect/protodesc"
	"google.golang.org/protobuf/reflect/protoreflect"
	"google.golang.org/protobuf/reflect/protoregistry"
	"google.golang.org/protobuf/types/descriptorpb"
	"google.golang.org/protobuf/types/pluginpb"
)

func fileName(f protoreflect.FileDescriptor) string {
	var parts []string
	rbPkg := f.Options().(*descriptorpb.FileOptions).GetRubyPackage()
	if rbPkg != "" {
		parts = strings.Split(rbPkg, "::")
		for i, part := range parts {
			parts[i] = strings.ToLower(part)
		}
	} else {
		parts = strings.Split(string(f.Package()), ".")
	}
	name := ""
	for i, part := range parts {
		if i > 0 {
			name += "/"
		}
		name += part
	}
	return name + "/" + filepath.Base(string(f.Path())) + ".pb.rb"
}

func getRbPkg(pkg protoreflect.FileDescriptor) string {
	rbPkg := pkg.Options().(*descriptorpb.FileOptions).GetRubyPackage()
	if rbPkg == "" {
		rbPkg = toRubyConstant(pkg)
	}
	return rbPkg
}

func toRubyConstant(d protoreflect.Descriptor) string {
	pkg := d.ParentFile()
	rbPkg := pkg.Options().(*descriptorpb.FileOptions).GetRubyPackage()
	parts := []string{}
	if rbPkg == "" {
		parts = strings.Split(string(pkg.Package()), ".")
		title := cases.Title(language.English)
		for i, part := range parts {
			parts[i] = title.String(part)
		}
	} else {
		parts = append(parts, rbPkg)
	}

	insert := len(parts)

	for d.Parent() != nil {
		parts = slices.Insert(parts, insert, string(d.Name()))
		d = d.Parent()
	}

	return strings.Join(parts, "::")
}

func writeReserved(g *Group, reserved interface {
	protoreflect.Descriptor
	ReservedNames() protoreflect.Names
}) {

	for i := 0; i < reserved.ReservedNames().Len(); i++ {
		name := reserved.ReservedNames().Get(i)
		// TODO: write comments

		g.Id("reserved_name").Call(Lit(string(name)))
	}
	if enumRanges, ok := reserved.(interface {
		ReservedRanges() protoreflect.EnumRanges
	}); ok {
		for i := 0; i < enumRanges.ReservedRanges().Len(); i++ {
			number := enumRanges.ReservedRanges().Get(i)
			start := int32(number[0])
			end := int32(number[1])
			g.Id("reserved_range").Call(Lit(start).Op("...").Lit(end))
		}
	} else if fieldRanges, ok := reserved.(interface {
		ReservedRanges() protoreflect.FieldRanges
	}); ok {
		for i := 0; i < fieldRanges.ReservedRanges().Len(); i++ {
			number := fieldRanges.ReservedRanges().Get(i)
			start := int32(number[0])
			end := int32(number[1])
			g.Id("reserved_range").Call(Lit(start).Op("...").Lit(end))
		}
	} else {
		panic("unimplemented")
	}
}

func Name(name protoreflect.Name) *Statement {
	return Id(string(name))
}

func writeComments(g *Group, loc protoreflect.SourceLocation) {
	if len(loc.LeadingComments) > 0 {
		g.Comment(loc.LeadingComments)
	}
}

func writeDescriptorComment(g *Group, desc protoreflect.Descriptor) {
	file := desc.ParentFile()
	loc := file.SourceLocations().ByDescriptor(desc)
	writeComments(g, loc)
}

func writeMessage(g *Group, message protoreflect.MessageDescriptor) {
	writeDescriptorComment(g, message)

	g.Class().Add(Name(message.Name())).EndedFunc(func(g *Group) {
		g.Id("extend").Id("Protobug::Message")
		g.Empty()
		g.Id("self").Dot("full_name").Op("=").Lit(string(message.FullName()))
		g.Empty()

		writeDeclarations(g, message)

		for i := 0; i < message.Fields().Len(); i++ {
			field := message.Fields().Get(i)
			writeDescriptorComment(g, field)
			if field.IsMap() {
				g.Commentf("map<%s, %s>: %s", field.MapKey().Kind(), field.MapValue().Kind(), field.Name())
				continue
			}
			g.Id(field.Cardinality().String()).CallFunc(func(g *Group) {
				g.Lit(int32(field.Number()))

				g.Lit(string(field.Name()))

				g.Id("type:").Id(":" + field.Kind().String())
				switch field.Kind() {
				case protoreflect.EnumKind:
					g.Id("enum_type:").Lit(string(field.Enum().FullName()))
				case protoreflect.MessageKind:
					g.Id("message_type:").Lit(string(field.Message().FullName()))
				}

				if field.HasJSONName() && field.JSONName() != string(field.Name()) {
					g.Id("json_name:").Lit(field.JSONName())
				}
				if field.ContainingOneof() != nil && !field.ContainingOneof().IsSynthetic() {
					g.Id("oneof:").Id(":" + string(field.ContainingOneof().Name()))
				}

				if field.IsPacked() {
					g.Id("packed:").Id("true")
				}
			})
		}

		writeReserved(g, message)
	})
}

func writeEnum(g *Group, enum protoreflect.EnumDescriptor) {
	writeDescriptorComment(g, enum)

	g.Class().Add(Name(enum.Name())).EndedFunc(func(g *Group) {
		g.Id("extend").Id("Protobug::Enum")
		g.Empty()
		g.Id("self").Dot("full_name").Op("=").Lit(string(enum.FullName()))
		g.Empty()

		for j := 0; j < enum.Values().Len(); j++ {
			value := enum.Values().Get(j)
			writeDescriptorComment(g, value)
			g.Add(Name(value.Name())).Op("=").Id("new").Call(Lit(string(value.Name())), Lit(int32(value.Number()))).Dot("freeze")
		}

		writeReserved(g, enum)
	})
}

type containsDecls interface {
	// Enums is a list of nested enum declarations.
	Enums() protoreflect.EnumDescriptors
	// Messages is a list of nested message declarations.
	Messages() protoreflect.MessageDescriptors
	// Extensions is a list of nested extension declarations.
	Extensions() protoreflect.ExtensionDescriptors
}

func writeDeclarations(g *Group, desc containsDecls) {
	first := true
	for i := 0; i < desc.Messages().Len(); i++ {
		message := desc.Messages().Get(i)
		if message.IsMapEntry() {
			continue
		}
		if !first {
			g.Empty()
		}
		first = false
		writeMessage(g, message)
	}

	for i := 0; i < desc.Enums().Len(); i++ {
		if !first {
			g.Empty()
		}
		first = false
		enum := desc.Enums().Get(i)
		writeEnum(g, enum)
	}

	for i := 0; i < desc.Extensions().Len(); i++ {
		if !first {
			g.Empty()
		}
		first = false
		extension := desc.Extensions().Get(i)
		g.Commentf("extension: %s %s %d", extension.Kind(), extension.Kind(), extension.Number())
	}
}

func insideNesting(pkg protoreflect.FileDescriptor, g *Group, fn func(g *Group)) {
	rbPkg := getRbPkg(pkg)
	parts := strings.Split(rbPkg, "::")

	var recur func(*Group, []string)
	recur = func(g *Group, parts []string) {
		if len(parts) == 0 {
			fn(g)
		} else {
			g.Module().Id(parts[0]).EndedFunc(func(i *Group) {
				recur(i, parts[1:])
			})
		}
	}

	recur(g, parts)
}

func genRb(f protoreflect.FileDescriptor, file *File) error {
	file.HeaderComment("frozen_string_literal: true")
	file.HeaderComment("Code generated by protoc-gen-protobug. DO NOT EDIT.")

	file.Commentf("source: %s", f.Path())
	file.Commentf("syntax: %s", f.Syntax())
	file.Commentf("package: %s", f.Package())
	file.Commentf("options:\n%s", text.Indent(prototext.Format(f.Options()), "  "))
	file.Empty()

	{
		loc := f.SourceLocations().Get(1)
		if len(loc.LeadingDetachedComments) > 0 {
			for _, c := range loc.LeadingDetachedComments {
				file.Comment(c)
			}
		}
		if len(loc.LeadingComments) > 0 {
			file.Comment(loc.LeadingComments)
		}
	}

	file.Empty()
	file.Id("require").Add(Lit("protobug"))
	file.Empty()

	for i := 0; i < f.Imports().Len(); i++ {
		file.Id("require").Add(Lit(fileName(f.Imports().Get(i))))
	}

	if f.Imports().Len() > 0 {
		file.Empty()
	}

	insideNesting(f, file.Group, func(g *Group) {
		writeDeclarations(g, f)

		g.Empty()

		if f.Services().Len() > 0 {
			for i := 0; i < f.Services().Len(); i++ {
				service := f.Services().Get(i)

				g.Id("warn").Lit(fmt.Sprintf("service %q not yet supported by protobug", service.Name()))
			}
			g.Empty()
		}

		registryName := filepath.Base(f.Path())
		registryName = strings.TrimSuffix(registryName, filepath.Ext(registryName))

		g.Def().Id("self").Dot("register_" + registryName + "_protos").Call(Id("registry")).EndedFunc(func(g *Group) {
			for i := 0; i < f.Imports().Len(); i++ {
				imp := f.Imports().Get(i)
				impName := filepath.Base(string(imp.Path()))
				impName = strings.TrimSuffix(impName, filepath.Ext(impName))
				impMod := getRbPkg(imp)
				g.Id(impMod).Dot("register_" + impName + "_protos").Call(Id("registry"))
			}

			var register func(containsDecls)
			register = func(desc containsDecls) {
				for i := 0; i < desc.Messages().Len(); i++ {
					message := desc.Messages().Get(i)
					if message.IsMapEntry() {
						continue
					}
					g.Id("registry").Dot("register").Call(Id(toRubyConstant(message)))
					register(message)
				}
				for i := 0; i < desc.Enums().Len(); i++ {
					enum := desc.Enums().Get(i)
					g.Id("registry").Dot("register").Call(Id(toRubyConstant(enum)))
				}
				for i := 0; i < desc.Extensions().Len(); i++ {
					extension := desc.Extensions().Get(i)
					g.Commentf("extension: %s %s %d", extension.FullName(), extension.Kind(), extension.Number())
				}
			}
			register(f)
		})
	})

	file.Empty()

	return nil
}

func main() {
	protogen.Options{}.Run(func(gen *protogen.Plugin) error {
		files := protoregistry.Files{}
		for _, file := range gen.Request.GetProtoFile() {
			fd, err := protodesc.NewFile(file, &files)
			if err != nil {
				return fmt.Errorf("failed to create file descriptor: %w", err)
			}
			err = files.RegisterFile(fd)
			if err != nil {
				return fmt.Errorf("failed to register file: %w", err)
			}
		}
		gen.SupportedFeatures |= uint64(pluginpb.CodeGeneratorResponse_FEATURE_PROTO3_OPTIONAL)
		for _, f := range gen.Request.ProtoFile {
			desc, err := files.FindFileByPath(f.GetName())
			if err != nil {
				return err
			}
			g := gen.NewGeneratedFile(fileName(desc), "")

			file := NewFile(fileName(desc))
			file.NoFormat = true
			if err := genRb(desc, file); err != nil {
				return err
			}
			// file.Comment(prototext.Format(f))

			if err := file.Render(g); err != nil {
				return err
			}
		}
		return nil
	})
}

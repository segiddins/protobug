# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: google/protobuf/compiler/plugin.proto
# syntax: proto2
# package: google.protobuf.compiler
# options:
#   java_package: "com.google.protobuf.compiler"
#   java_outer_classname: "PluginProtos"
#   go_package: "google.golang.org/protobuf/types/pluginpb"
#   csharp_namespace: "Google.Protobuf.Compiler"

# Protocol Buffers - Google's data interchange format
# Copyright 2008 Google Inc.  All rights reserved.
#
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file or at
# https://developers.google.com/open-source/licenses/bsd

# Author: kenton@google.com (Kenton Varda)
#
# protoc (aka the Protocol Compiler) can be extended via plugins.  A plugin is
# just a program that reads a CodeGeneratorRequest from stdin and writes a
# CodeGeneratorResponse to stdout.
#
# Plugins written using C++ can use google/protobuf/compiler/plugin.h instead
# of dealing with the raw protocol defined here.
#
# A plugin executable needs only to be placed somewhere in the path.  The
# plugin should be named "protoc-gen-$NAME", and will then be used when the
# flag "--${NAME}_out" is passed to protoc.

require "protobug"

require "google/protobuf/descriptor_pb"

module Google
  module Protobuf
    module Compiler
      # The version number of protocol compiler.
      class Version
        extend Protobug::Message

        self.full_name = "google.protobuf.compiler.Version"

        optional(1, "major", type: :int32)
        optional(2, "minor", type: :int32)
        optional(3, "patch", type: :int32)
        # A suffix for alpha, beta or rc release, e.g., "alpha-1", "rc2". It should
        # be empty for mainline stable releases.
        optional(4, "suffix", type: :string)
      end

      # An encoded CodeGeneratorRequest is written to the plugin's stdin.
      class CodeGeneratorRequest
        extend Protobug::Message

        self.full_name = "google.protobuf.compiler.CodeGeneratorRequest"

        # The .proto files that were explicitly listed on the command-line.  The
        # code generator should generate code only for these files.  Each file's
        # descriptor will be included in proto_file, below.
        repeated(
          1,
          "file_to_generate",
          type: :string,
          json_name: "fileToGenerate"
        )
        # The generator parameter passed on the command-line.
        optional(2, "parameter", type: :string)
        # FileDescriptorProtos for all files in files_to_generate and everything
        # they import.  The files will appear in topological order, so each file
        # appears before any file that imports it.
        #
        # Note: the files listed in files_to_generate will include runtime-retention
        # options only, but all other files will include source-retention options.
        # The source_file_descriptors field below is available in case you need
        # source-retention options for files_to_generate.
        #
        # protoc guarantees that all proto_files will be written after
        # the fields above, even though this is not technically guaranteed by the
        # protobuf wire format.  This theoretically could allow a plugin to stream
        # in the FileDescriptorProtos and handle them one by one rather than read
        # the entire set into memory at once.  However, as of this writing, this
        # is not similarly optimized on protoc's end -- it will store all fields in
        # memory at once before sending them to the plugin.
        #
        # Type names of fields and extensions in the FileDescriptorProto are always
        # fully qualified.
        repeated(
          15,
          "proto_file",
          type: :message,
          message_type: "google.protobuf.FileDescriptorProto",
          json_name: "protoFile"
        )
        # File descriptors with all options, including source-retention options.
        # These descriptors are only provided for the files listed in
        # files_to_generate.
        repeated(
          17,
          "source_file_descriptors",
          type: :message,
          message_type: "google.protobuf.FileDescriptorProto",
          json_name: "sourceFileDescriptors"
        )
        # The version number of protocol compiler.
        optional(
          3,
          "compiler_version",
          type: :message,
          message_type: "google.protobuf.compiler.Version",
          json_name: "compilerVersion"
        )
      end

      # The plugin writes an encoded CodeGeneratorResponse to stdout.
      class CodeGeneratorResponse
        extend Protobug::Message

        self.full_name = "google.protobuf.compiler.CodeGeneratorResponse"

        # Error message.  If non-empty, code generation failed.  The plugin process
        # should exit with status code zero even if it reports an error in this way.
        #
        # This should be used to indicate errors in .proto files which prevent the
        # code generator from generating correct code.  Errors which indicate a
        # problem in protoc itself -- such as the input CodeGeneratorRequest being
        # unparseable -- should be reported by writing a message to stderr and
        # exiting with a non-zero status code.
        optional(1, "error", type: :string)
        # A bitmask of supported features that the code generator supports.
        # This is a bitwise "or" of values from the Feature enum.
        optional(
          2,
          "supported_features",
          type: :uint64,
          json_name: "supportedFeatures"
        )
        # Sync with code_generator.h.
        class Feature
          extend Protobug::Enum

          self.full_name = "google.protobuf.compiler.CodeGeneratorResponse.Feature"

          FEATURE_NONE = new("FEATURE_NONE", 0).freeze
          FEATURE_PROTO3_OPTIONAL = new("FEATURE_PROTO3_OPTIONAL", 1).freeze
          FEATURE_SUPPORTS_EDITIONS = new("FEATURE_SUPPORTS_EDITIONS", 2).freeze
        end

        # The minimum edition this plugin supports.  This will be treated as an
        # Edition enum, but we want to allow unknown values.  It should be specified
        # according the edition enum value, *not* the edition number.  Only takes
        # effect for plugins that have FEATURE_SUPPORTS_EDITIONS set.
        optional(
          3,
          "minimum_edition",
          type: :int32,
          json_name: "minimumEdition"
        )
        # The maximum edition this plugin supports.  This will be treated as an
        # Edition enum, but we want to allow unknown values.  It should be specified
        # according the edition enum value, *not* the edition number.  Only takes
        # effect for plugins that have FEATURE_SUPPORTS_EDITIONS set.
        optional(
          4,
          "maximum_edition",
          type: :int32,
          json_name: "maximumEdition"
        )
        # Represents a single generated file.
        class File
          extend Protobug::Message

          self.full_name = "google.protobuf.compiler.CodeGeneratorResponse.File"

          # The file name, relative to the output directory.  The name must not
          # contain "." or ".." components and must be relative, not be absolute (so,
          # the file cannot lie outside the output directory).  "/" must be used as
          # the path separator, not "\".
          #
          # If the name is omitted, the content will be appended to the previous
          # file.  This allows the generator to break large files into small chunks,
          # and allows the generated text to be streamed back to protoc so that large
          # files need not reside completely in memory at one time.  Note that as of
          # this writing protoc does not optimize for this -- it will read the entire
          # CodeGeneratorResponse before writing files to disk.
          optional(1, "name", type: :string)
          # If non-empty, indicates that the named file should already exist, and the
          # content here is to be inserted into that file at a defined insertion
          # point.  This feature allows a code generator to extend the output
          # produced by another code generator.  The original generator may provide
          # insertion points by placing special annotations in the file that look
          # like:
          #   @@protoc_insertion_point(NAME)
          # The annotation can have arbitrary text before and after it on the line,
          # which allows it to be placed in a comment.  NAME should be replaced with
          # an identifier naming the point -- this is what other generators will use
          # as the insertion_point.  Code inserted at this point will be placed
          # immediately above the line containing the insertion point (thus multiple
          # insertions to the same point will come out in the order they were added).
          # The double-@ is intended to make it unlikely that the generated code
          # could contain things that look like insertion points by accident.
          #
          # For example, the C++ code generator places the following line in the
          # .pb.h files that it generates:
          #   // @@protoc_insertion_point(namespace_scope)
          # This line appears within the scope of the file's package namespace, but
          # outside of any particular class.  Another plugin can then specify the
          # insertion_point "namespace_scope" to generate additional classes or
          # other declarations that should be placed in this scope.
          #
          # Note that if the line containing the insertion point begins with
          # whitespace, the same whitespace will be added to every line of the
          # inserted text.  This is useful for languages like Python, where
          # indentation matters.  In these languages, the insertion point comment
          # should be indented the same amount as any inserted code will need to be
          # in order to work correctly in that context.
          #
          # The code generator that generates the initial file and the one which
          # inserts into it must both run as part of a single invocation of protoc.
          # Code generators are executed in the order in which they appear on the
          # command line.
          #
          # If |insertion_point| is present, |name| must also be present.
          optional(
            2,
            "insertion_point",
            type: :string,
            json_name: "insertionPoint"
          )
          # The file contents.
          optional(15, "content", type: :string)
          # Information describing the file content being inserted. If an insertion
          # point is used, this information will be appropriately offset and inserted
          # into the code generation metadata for the generated files.
          optional(
            16,
            "generated_code_info",
            type: :message,
            message_type: "google.protobuf.GeneratedCodeInfo",
            json_name: "generatedCodeInfo"
          )
        end

        repeated(
          15,
          "file",
          type: :message,
          message_type: "google.protobuf.compiler.CodeGeneratorResponse.File"
        )
      end

      def self.register_plugin_protos(registry)
        Google::Protobuf.register_descriptor_protos(registry)
        registry.register(Google::Protobuf::Compiler::Version)
        registry.register(Google::Protobuf::Compiler::CodeGeneratorRequest)
        registry.register(Google::Protobuf::Compiler::CodeGeneratorResponse)
        registry.register(
          Google::Protobuf::Compiler::CodeGeneratorResponse::Feature
        )
        registry.register(
          Google::Protobuf::Compiler::CodeGeneratorResponse::File
        )
      end
    end
  end
end
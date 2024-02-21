package rubby

import (
	"bytes"
	"io"

	"github.com/kr/text"
)

// Code represents an item of code that can be rendered.
type Code interface {
	render(f *File, w io.Writer, s *Statement) error
	isNull(f *File) bool
}

// Group represents a list of Code items, separated by tokens with an optional
// open and close token.
type Group struct {
	name      string
	items     []Code
	open      string
	close     string
	separator string
	multi     bool
	indent    bool
}

func (g *Group) isNull(f *File) bool {
	if g == nil {
		return true
	}
	if g.open != "" || g.close != "" {
		return false
	}
	return g.isNullItems(f)
}

func (g *Group) isNullItems(f *File) bool {
	for _, c := range g.items {
		if !c.isNull(f) {
			return false
		}
	}
	return true
}

func (g *Group) render(f *File, w io.Writer, s *Statement) error {
	if g.name == "ended" && g.isNullItems(f) {
		// Special case for ended - if all items are null, don't render the open/close tokens.
		if _, err := w.Write([]byte("; end")); err != nil {
			return err
		}
		return nil
	}
	if g.open != "" {
		if _, err := w.Write([]byte(g.open)); err != nil {
			return err
		}
	}
	isNull, err := g.renderItems(f, w)
	if err != nil {
		return err
	}
	if !isNull && g.multi && g.close != "" {
		// For multi-line blocks with a closing token, we insert a new line after the last item (but
		// not if all items were null). This is to ensure that if the statement finishes with a comment,
		// the closing token is not commented out.
		s := "\n"
		if g.separator == "," {
			// We also insert add trailing comma if the separator was ",".
			s = ",\n"
		}
		if _, err := w.Write([]byte(s)); err != nil {
			return err
		}
	}
	if g.close != "" {
		if _, err := w.Write([]byte(g.close)); err != nil {
			return err
		}
	}
	return nil
}

func (g *Group) renderItems(f *File, w io.Writer) (isNull bool, err error) {
	first := true
	if g.indent {
		w = text.NewIndentWriter(w, []byte("  "))
	}
	for _, code := range g.items {
		if code == nil || code.isNull(f) {
			// Null() token produces no output but also
			// no separator. Empty() token products no
			// output but adds a separator.
			continue
		}
		if !first && g.separator != "" {
			// The separator token is added before each non-null item, but not before the first item.
			if _, err := w.Write([]byte(g.separator)); err != nil {
				return false, err
			}
		}
		if g.multi {
			// For multi-line blocks, we insert a new line before each non-null item.
			if _, err := w.Write([]byte("\n")); err != nil {
				return false, err
			}
		}
		if err := code.render(f, w, nil); err != nil {
			return false, err
		}
		first = false
	}
	return first, nil
}

// Render renders the Group to the provided writer.
func (g *Group) Render(writer io.Writer) error {
	return g.RenderWithFile(writer, NewFile(""))
}

// RenderWithFile renders the Group to the provided writer, using imports from the provided file.
func (g *Group) RenderWithFile(writer io.Writer, file *File) error {
	buf := &bytes.Buffer{}
	if err := g.render(file, buf, nil); err != nil {
		return err
	}
	b := buf.Bytes()
	if _, err := writer.Write(b); err != nil {
		return err
	}
	return nil
}

// Lit renders a literal. Lit supports only built-in types (bool, string, int, complex128, float64,
// float32, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, uintptr and complex64).
// Passing any other type will panic.
func Lit(v interface{}) *Statement {
	return newStatement().Lit(v)
}

// Lit renders a literal. Lit supports only built-in types (bool, string, int, complex128, float64,
// float32, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, uintptr and complex64).
// Passing any other type will panic.
func (g *Group) Lit(v interface{}) *Statement {
	s := Lit(v)
	g.items = append(g.items, s)
	return s
}

// Lit renders a literal. Lit supports only built-in types (bool, string, int, complex128, float64,
// float32, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, uintptr and complex64).
// Passing any other type will panic.
func (s *Statement) Lit(v interface{}) *Statement {
	t := token{
		typ:     literalToken,
		content: v,
	}
	*s = append(*s, t)
	return s
}

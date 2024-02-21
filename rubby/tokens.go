package rubby

import (
	"fmt"
	"io"
	"strings"
)

type tokenType string

const (
	identifierToken tokenType = "identifier"
	keywordToken    tokenType = "keyword"
	operatorToken   tokenType = "operator"
	delimiterToken  tokenType = "delimiter"
	literalToken    tokenType = "literal"
	nullToken       tokenType = "null"
)

type token struct {
	typ     tokenType
	content interface{}
}

func (t token) isNull(f *File) bool {
	return t.typ == nullToken
}
func (t token) render(f *File, w io.Writer, _ *Statement) error {
	switch t.typ {
	case literalToken:
		var out string
		switch t.content.(type) {
		case bool, string, int, complex128:
			// default constant types can be left bare
			out = fmt.Sprintf("%#v", t.content)
		case float64:
			out = fmt.Sprintf("%#v", t.content)
			if !strings.Contains(out, ".") && !strings.Contains(out, "e") {
				// If the formatted value is not in scientific notation, and does not have a dot, then
				// we add ".0". Otherwise it will be interpreted as an int.
				// See:
				// https://github.com/dave/jennifer/issues/39
				// https://github.com/golang/go/issues/26363
				out += ".0"
			}
		case float32, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, uintptr:
			out = fmt.Sprintf("%#v", t.content)
		case complex64:
			// fmt package already renders parenthesis for complex64
			out = fmt.Sprintf("%T%#v", t.content, t.content)
		default:
			panic(fmt.Sprintf("unsupported type for literal: %T", t.content))
		}
		if _, err := w.Write([]byte(out)); err != nil {
			return err
		}

	case keywordToken, operatorToken, delimiterToken:
		if _, err := w.Write([]byte(fmt.Sprintf("%s", t.content))); err != nil {
			return err
		}
	case identifierToken:
		if _, err := w.Write([]byte(t.content.(string))); err != nil {
			return err
		}
	case nullToken: // notest
		// do nothing (should never render a null token)
	}
	return nil
}

// Empty adds an empty item. Empty items render nothing but are followed by a
// separator in lists.
func Empty() *Statement {
	return newStatement().Empty()
}

// Empty adds an empty item. Empty items render nothing but are followed by a
// separator in lists.
func (g *Group) Empty() *Statement {
	s := Empty()
	g.items = append(g.items, s)
	return s
}

// Empty adds an empty item. Empty items render nothing but are followed by a
// separator in lists.
func (s *Statement) Empty() *Statement {
	t := token{
		typ:     operatorToken,
		content: "",
	}
	*s = append(*s, t)
	return s
}

// Op renders the provided operator / token.
func Op(op string) *Statement {
	return newStatement().Op(op)
}

// Op renders the provided operator / token.
func (g *Group) Op(op string) *Statement {
	s := Op(op)
	g.items = append(g.items, s)
	return s
}

// Op renders the provided operator / token.
func (s *Statement) Op(op string) *Statement {
	t := token{
		typ:     operatorToken,
		content: op,
	}
	*s = append(*s, t)
	return s
}

// Id renders an identifier.
func Id(name string) *Statement {
	return newStatement().Id(name)
}

// Id renders an identifier.
func (g *Group) Id(name string) *Statement {
	s := Id(name)
	g.items = append(g.items, s)
	return s
}

// Id renders an identifier.
func (s *Statement) Id(name string) *Statement {
	t := token{
		typ:     identifierToken,
		content: name,
	}
	*s = append(*s, t)
	return s
}

func Null() *Statement {
	return newStatement().Null()
}

func (g *Group) Null() *Statement {
	s := Null()
	g.items = append(g.items, s)
	return s
}

func (s *Statement) Null() *Statement {
	t := token{
		typ:     nullToken,
		content: "null",
	}
	*s = append(*s, t)
	return s
}

// Dot renders a period followed by an identifier.
func (s *Statement) Dot(name string) *Statement {
	d := token{
		typ:     delimiterToken,
		content: ".",
	}
	t := token{
		typ:     identifierToken,
		content: name,
	}
	*s = append(*s, d, t)
	return s
}

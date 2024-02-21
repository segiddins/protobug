package rubby

import (
	"bytes"
	"fmt"
	"io"
	"strings"
)

func Comment(str string) *Statement {
	return newStatement().Comment(str)
}

func (g *Group) Comment(str string) *Statement {
	s := Comment(str)
	g.items = append(g.items, s)
	return s
}

func (s *Statement) Comment(str string) *Statement {
	c := comment{
		comment: str,
	}
	*s = append(*s, c)
	return s
}

// Commentf adds a comment, using a format string and a list of parameters. If
// the provided string contains a newline, the comment is formatted in
// multiline style. If the comment string starts with "//" or "/*", the
// automatic formatting is disabled and the string is rendered directly.
func Commentf(format string, a ...interface{}) *Statement {
	return newStatement().Commentf(format, a...)
}

// Commentf adds a comment, using a format string and a list of parameters. If
// the provided string contains a newline, the comment is formatted in
// multiline style. If the comment string starts with "//" or "/*", the
// automatic formatting is disabled and the string is rendered directly.
func (g *Group) Commentf(format string, a ...interface{}) *Statement {
	s := Commentf(format, a...)
	g.items = append(g.items, s)
	return s
}

// Commentf adds a comment, using a format string and a list of parameters. If
// the provided string contains a newline, the comment is formatted in
// multiline style. If the comment string starts with "//" or "/*", the
// automatic formatting is disabled and the string is rendered directly.
func (s *Statement) Commentf(format string, a ...interface{}) *Statement {
	c := comment{
		comment: fmt.Sprintf(format, a...),
	}
	*s = append(*s, c)
	return s
}

type comment struct {
	comment string
}

func (c comment) isNull(f *File) bool {
	return false
}

func (c comment) render(f *File, w io.Writer, s *Statement) error {
	if strings.HasPrefix(c.comment, "#") {
		// automatic formatting disabled.
		if _, err := w.Write([]byte(c.comment)); err != nil {
			return err
		}
		return nil
	}
	pre := strings.HasPrefix(c.comment, " ")

	var comment []byte
	bol := true
	for _, c := range []byte(c.comment) {
		if bol {
			comment = append(comment, '#')
			if !pre && c != '\n' {
				comment = append(comment, ' ')
			}
		}
		comment = append(comment, c)
		bol = c == '\n'
	}
	comment = bytes.TrimRight(comment, "\n")

	if _, err := w.Write(comment); err != nil {
		return err
	}
	return nil
}

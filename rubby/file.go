package rubby

import (
	"bytes"
	"fmt"
	"io"
	"os/exec"
	"strings"
)

type File struct {
	*Group

	name string

	headers []string

	// NoFormat can be set to true to disable formatting of the generated source. This may be useful
	// when performance is critical, and readable code is not required.
	NoFormat bool
}

func NewFile(name string) *File {
	return &File{
		Group: &Group{
			multi: true,
			name:  name,
		},
	}
}

// HeaderComment adds a comment to the top of the file, above any package
// comments. A blank line is rendered below the header comments, ensuring
// header comments are not included in the package doc.
func (f *File) HeaderComment(comment string) {
	f.headers = append(f.headers, comment)
}

// Render renders the file to the provided writer.
func (f *File) Render(w io.Writer) error {
	body := &bytes.Buffer{}
	if err := f.render(f, body, nil); err != nil {
		return err
	}
	source := &bytes.Buffer{}
	if len(f.headers) > 0 {
		for _, c := range f.headers {
			if err := Comment(c).render(f, source, nil); err != nil {
				return err
			}
			if _, err := fmt.Fprint(source, "\n"); err != nil {
				return err
			}
		}
		// Append an extra newline so that header comments don't get lumped in
		// with package comments.
		if _, err := fmt.Fprint(source, "\n"); err != nil {
			return err
		}
	}

	if _, err := source.Write(body.Bytes()); err != nil {
		return err
	}
	var output []byte
	if f.NoFormat {
		output = source.Bytes()
	} else {
		name := f.name
		if name == "" {
			name = "untitled.rb"
		}
		cmd := exec.Command("rubocop", "--autocorrect", "--stderr", "--stdin", name, "--force-default-config", "--fail-level", "error")
		cmd.Stdin = strings.NewReader(source.String())
		stderr := bytes.NewBuffer(nil)
		out := bytes.NewBuffer(nil)
		cmd.Stdout = out
		cmd.Stderr = stderr

		err := cmd.Run()
		if err != nil {
			return fmt.Errorf("error %w while formatting source:\n%s\n%+v", err, stderr.String(), cmd)
		}

		output = out.Bytes()
	}
	if _, err := w.Write(output); err != nil {
		return err
	}
	return nil
}

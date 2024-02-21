package main

import (
	"bytes"
	"os"
)

func main() {
	// notest
	buf := &bytes.Buffer{}
	if err := render(buf); err != nil {
		panic(err)
	}
	if err := os.WriteFile("./rubby/generated.go", buf.Bytes(), 0644); err != nil {
		panic(err)
	}
}

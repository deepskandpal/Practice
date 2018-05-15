package main

import (
	"fmt"
	"gopkg.in/h2non/filetype.v1"
	"io/ioutil"
)

func main() {
	buf, _ := ioutil.ReadFile("sample.jpg")

	kind, unknown := filetype.Match(buf)
	if unknown != nil {
		fmt.Printf("Unknown: %s", unknown)
		return
	}

	fmt.Printf("File type: %s\n", kind.Extension)
}

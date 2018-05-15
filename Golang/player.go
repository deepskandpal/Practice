package main

import (
	"fmt"
	"gopkg.in/h2non/filetype.v1"
	"io/ioutil"
	"os"
)

func main() {
	// First element in os.Args is always the program name

	if len(os.Args) < 2 {
		fmt.Println("Missing parameter, provide file name!")
		return
	}
	data, err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		fmt.Println("Can't read file:", os.Args[1])
		panic(err)
	}
	fmt.Println("File content is:")
  fmt.Println(string(data))
	buf, _ := ioutil.ReadFile("sample.jpg")
	kind, unknown := filetype.Match(buf)
	if unknown != nil {
		fmt.Printf("Unknown: %s", unknown)
		return
	}

	fmt.Printf("File type: %s. MIME: %s\n", kind.Extension)
}

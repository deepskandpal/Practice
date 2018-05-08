//Dup prints the count and text of lines that appear more than once 
//in the input it reads from stdin or from a list of named files
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main(){
	counts := make(map[string]int)
	files := os.Args[1:]
	if len(files)==0{
		countLine(os.Stdin,counts)
	}else {
		for _,arg :=range files {
			f, err :=os.Open(arg)
			if err!=nil {
				fmt.Fprintf(os.Stderr ,"dup2: %v\n",err)
				continue
			}
			countLine(f,counts)
			f.Close()
		}
	}
	for line, n := range counts{
		if n>1 {
			fmt.Printf("%d\t%\n",n,line)
		}
	}
}
func countLine(f*os.File,counts map[string]int){
	input := bufio.NewScanner(f)
	for input.Scan(){
		counts[input.Text()]++
	}
}
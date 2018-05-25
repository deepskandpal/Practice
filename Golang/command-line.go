//echo functionality of the terminal build using go

package main //defining the package to which the source code belongs to

import (
	"fmt"     //importing formant package for basic IO functions
	"os"      // importing OS package for os.Args variable to take command line agruements
	"strings" //for the Join function
)

func main() {
	s, sep := "", ""                  // defining 2 variables s ande sep as string both if not initialized explicitly will be by default initialized to empty string
	for _, arg := range os.Args[1:] { //blank identifier when syntax requires variable but the logic doesn't
		s += sep + arg //concatenate sep and the os argument together in s
		sep = " "      //sep is a space
	}

	fmt.Println(os.Args[0])
	fmt.Println(strings.Join(os.Args[1:], " "))
	//fmt.Println(os.Args[1:])
}

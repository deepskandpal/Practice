package main //defining the package to which the source code belongs to

import (
	"fmt"    //importing formant package for basic IO functions
	"os"     // importing OS package for os.Args variable to take command line agruements
)

func main() {
	var s, sep string // defining 2 variables s ande sep as string both if not initialized explicitly will be by default initialized to empty string
	for i := 1; i < len(os.Args); i++ {  //run the for loop till the time the user is entereing the arguements
		s += sep + os.Args[i] //concatenate sep and the os argument together in s
		sep = " " //sep is an space
	}
	fmt.Println(s) //print s 
}

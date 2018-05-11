package main

import (
	"fmt"
	"time"
)

func main() {
	i := 2
	fmt.Println("write i as ,", i)
	switch i {
	case 1:
		fmt.Println("one")
	case 2:
		fmt.Println("two")
	case 3:
		fmt.Println("three")
	}
	switch time.Now().Weekday() {
	case time.Saturday, time.Sunday:
		fmt.Println("It's a weekend")
	default:
		fmt.Println("It's a Weekday")
	}
	t := time.Now()
	switch {
	case t.Hour() < 12:
		fmt.Println("it's Before noon")
	default:
		fmt.Println("it's after noon ")
	}
}
  

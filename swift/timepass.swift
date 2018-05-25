print ("enter your age","\r")
let age = readLine()
print ("your age is \(age!)")

func solveMefirst( number1 : Int, number2 :  Int ) -> Int {
    return number1 + number2
}
print ("enter first number")
let num1 = readLine()
print ("enter second number")
let num2 = readLine()
var IntNum1 = Int(num1!)
var IntNum2 = Int(num2!)
let sum = solveMefirst(number1 : IntNum1!, number2:  IntNum2!)
print ("the sum is \(sum)")

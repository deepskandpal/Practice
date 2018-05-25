func hello (person :String ) -> String {
  let hello = "hello " + person + "!"
  return hello
}

print ("enter a name ")
let name = readLine()
print(hello(person : "\(name!)"))

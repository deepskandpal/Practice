var emptyArray:Array<String> = []
var emptyArray2 = Array<String>()
var emptyArray3 = [Double]()
var emptyArray4:[Int]=[]

var levelDifficulties = ["Easy" ,"Moderate","Difficult","Veteran"]

print(levelDifficulties.count)
var easyDifficulty = levelDifficulties[0]
print(easyDifficulty )

for difficulty in levelDifficulties {
  print(difficulty)
}

for (index, difficulty) in levelDifficulties.enumerated() {
  print("\(index) -> \(difficulty)")
}

var characterClasses = ["Heros","Rangers","Knight"]
print(characterClasses)
characterClasses[1]="Druid"
print(characterClasses)
characterClasses.append("Acolyte")
print(characterClasses)
characterClasses += ["Healer", "Villager"]
print(characterClasses)
characterClasses.insert("Halo" , at:2)
print(characterClasses)
characterClasses.remove(at:1)
print(characterClasses)
characterClasses.reverse()
print(characterClasses)
print(characterClasses.contains("Heros"))

var guns : [[String]] = [
  ["M4A1","Dessert Eagle","Krieg Commando"],
  ["CV-47","Magnum","Dual Pistols"]
]
print(guns)
var csguns = guns[0][2]
print(csguns)


var emptyDictionary1: Dictionary<Int, Int> = [:]
var emptyDictionary2 = Dictionary<Int,String>()
var emptyDictionary3 = [String:String]()
var emptyDictionary4:[String:String]=[:]

var wineShop = ["Redwine":300 , "Blenders Pride":600, "Old Monk":300]
print(wineShop)
let allPrice = [Int](wineShop.values)
let allKeys = [String](wineShop.keys)
print(allKeys)
print(allPrice)

let pricebe = wineShop["Redwine"]
print(pricebe!)

for (item_name , item_value) in wineShop {
  print(item_name,item_value)
}

var electronicstore:[String:Int] = ["washingmachine":12000,"TV":30000,"AC":25000]
print(electronicstore)

electronicstore["Mobile"]=30000
print(electronicstore)

let oldval = electronicstore.updateValue(340000,forKey:"TV")
print(oldval!)
print(electronicstore)


var quest = [
  "fetch gemstone": [
    "objective":"retrieve 5 gemstones",
    "Hidden objective":"complete the task in 5 minutes"
  ]
]

var questdictionary = quest["fetch gemstone"]?["objective"]
print(questdictionary!)

var emptyset = Set<Int> ()
var emptyset2 :Set<Int> = []

var activeset:Set = ["firefly" ,"the joker" ,"black mask" ,"bane"]
print(activeset)
print(activeset.count)
print(activeset.isEmpty)
activeset.insert("poisonivy")
print(activeset)
activeset.remove("firefly")
print(activeset)
print(activeset.sorted())

for (index) in activeset{
  print(index)
}
for (index) in activeset.sorted(){
  print(index)
}

var batmanVillans:Set = ["the joker", "bane","rache-al-gul","catwoman"]
var batmanAllies:Set = ["Robin", "jim gorden","catwoman","Oracle","Alfred"]
//print(batmanAllies.intersecton(batmanVillans))
//print(batmanVillans.intersecton(batmanAllies))
print(batmanAllies.symmetricDifference(batmanVillans))
print(batmanAllies.union(batmanVillans))
print(batmanAllies.subtract(batmanVillans))


var shopItemsArray = ["vegetable","fruit","utensil"]
print(shopItemsArray)
var shopItemsDict = ["vegetable":10,"fruit":20,"utensil":30]
print(shopItemsDict)
print(shopItemsArray.contains("mobile"))
shopItemsArray.insert("mobile" , at :3)
print(shopItemsArray)

var hp = 96
var bhp = 100
if hp >= bhp {
  print("hp is greater than bhp")
}

else if hp <= 51 {
  print("grab some health")
}

else {
  print("hp is between 51 and 99")
}

var itemGathered:String?

if let item = itemGathered {
  print("congrats you found an item \(item)")
}
else {
  print("sorry no item found")
}

class Adventurer {
  var equippedWeapon: Weapon?
}

class Weapon {
  var name:String = "Fists"
}

let newAdventurer=Adventurer()
newAdventurer.equippedWeapon = Weapon()

if let weaponName = newAdventurer.equippedWeapon?.name {
  print("your new weapon is \(weaponName)")
}
else  {
  print("you have no new weapon")
}

var carTypes = ["Sedan" , "Suv" , "hatchBack"]
var customer = "Hello customer"

for typeCars in carTypes {
  print(typeCars)
}

for char in customer {
  print(char)
}

for item in 1...5 {
  print(item)
}

var hitCount = 5
for number in 1..<hitCount {
  print(number)
}

var playerHp = 5

while playerHp > 0 {
  playerHp -= 1
  print("player hp at \(playerHp)")
}

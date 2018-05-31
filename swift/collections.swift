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

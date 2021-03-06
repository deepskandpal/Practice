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

repeat {
   playerHp -= 1
   print("playerHp at \(playerHp)")
} while playerHp >= 0

/* var health:Int , ammo:Int = 92 , 40

switch (health,ammo) {
case (0,0):
  print("I'm sorry to tell you, you're not alive")

case (24...50,34...50) :
  print("Did someone hit you recently")

case (50...90,50...90):
  print("you are in a fightable position")

default:
    print("You are fine")
}
*/

func computeBonusDamage (damage:Int) -> Int {
  return damage*4
}

func dealDamage (baseDamage:Int, computeFunc:(Int)->Int) {
  let bonus = computeFunc(baseDamage)
  print("base damage \(baseDamage)\n bonus damage \(bonus) \n\n \(bonus + baseDamage) total damage ")
}

dealDamage(baseDamage:23,computeFunc:computeBonusDamage)


var closureDeclaration: ()->() = {}

var saluteHunter = {(parameterString: String) -> Void in
 print(parameterString)
}

saluteHunter("Hello Hunter")


var saluteHunterShortHand :(String)->String = { message in
  return "\(message) swift!"
}

saluteHunterShortHand("Hello ")

func fetchClosestHunter(closure :([String]) -> Void) {
  let hunters = ["Morgan","Robert","Harrsion"]
  closure (hunters)
}

fetchClosestHunter {(hunters) in
 for hunter in hunters {
   print("hunter->\(hunter)")
 }
}

typealias AttackTuple = (String , Int ,Bool)
var sunStrike:AttackTuple = ("SunStrike",35,false)

typealias ArrayClosure   = ([Int]) -> Void

func returnAttack ()-> AttackTuple{
  return("HammerSweep",22,true)
}

print(returnAttack())

func fetchPlayerScores (closure:ArrayClosure) {
  let scores = [934,222,101]
  closure(scores)
}

fetchPlayerScores { (scores) in
 print("Top scores")
 for score in scores {
   print(score)
 }
}

class adventurer {
  var name:String
  static var credo = " Defend the helpless"

  init(name:String) {
      self.name = name
  }

  //Instance method

  func attack (damage:Int) {
    print("Attacking for \(damage) hit points! ")
  }
  //type method
  static func printCredo(){
    print(credo)
  }
}

class ranger : adventurer {
  var classAdvantage :String
  init(name:String, advantage:String) {
      self.classAdvantage = advantage
      super.init(name:name)
      }
  override func attack (damage:Int) {
     print("ranger attack for \(damage)")
     }
}

var advent = adventurer(name:"Harrison")
var Ranger = ranger(name:"Steven",advantage:"Stealth")
advent.attack(damage:40)
Ranger.attack(damage:94)
struct Level {
    //instance properites
    
    let levelId:Int
    var levelObjective:String
    
    //optional
    var hiddenArea:String?
    
    //computation properties
    var leveDescritopn:String{
        return "Level ID :\(levelId)->Level Objective :\(levelObjective)"
    }
}

var dungeon = Level(levelId: 1, levelObjective: "Clear the bigboss", hiddenArea: nil)

print(dungeon.leveDescritopn)

struct level {
    var objective = ["find the lost cat","collect all gemsstone","defeat the bigboss"]
    func queryObjective(){
        for (index, objective) in objective.enumerated(){
            print("\(index): \(objective)")
            }
    }
        mutating func completeObjective (index:Int) {
            objective.remove(at: index)
        }
}
var marshLands = level()
marshLands.completeObjective(index: 0)
marshLands.queryObjective()
enum armourType {
    case Heavy
    case Medium
    case Light
    
}

enum weaponType {
    case sword, Hammer, Fists
}


var currentArmour = armourType.Heavy

print("you currently have \(currentArmour) armour equipped")
print("your armour type is at position \(currentArmour.hashValue) in the enum")

enum NPC:String {
    case  Villager = "Common to villages not much usefull info"
    case  Cheif = " one per village, will have quest info"
    case  Blacksmith = "No limit per village, will make you cool stuff"
}

var blacksmith = NPC.Blacksmith
print(blacksmith.rawValue)

enum PlayerState {
    case Alive
    case KD (restartToLevel:Int)
    case Unkown (debug:String)
}

var currentState = PlayerState.KD(restartToLevel: 1)

switch currentState {
    
case .Alive:
    print("I'm Still here")
case .KD(let restartToLevel):
    print("Woops, You will have to start again at leve \(restartToLevel)")
case .Unkown(let debug):
    print("Sorry , we are experiencing some difficulties :\(debug)")
}


protocol Nameable {
    var firstName : String {get}
    var lastName  : String {get set}
    func  createFullName() -> String
}

extension Nameable {
    func createFullName() -> String {
        return "\(firstName) \(lastName) Loves Swift 4"
    }
}

struct Player : Nameable{
    var firstName: String
    var lastName: String
}

let knewPlayer = Player(firstName: "Harrison", lastName: "Ferrone")
print(knewPlayer.createFullName())



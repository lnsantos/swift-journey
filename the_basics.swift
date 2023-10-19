var variableNumber = 42
var variabelString = "Learning"
var variableDouble = 0.6

let myConstant = 42

print("const is ", myConstant)
print("number is ", variableNumber)
print("double is ", variableDouble)
print("string is ", variabelString)

let description = "my name is "
let year = 30
let finalDescription = description + String(year)

print(".", finalDescription, separator: " - ")

let testSplit = "Test logic in string: \(year + 2000) \(finalDescription)"

print(testSplit)

let quotation = """

   {
     "data": {
        "description": "\(testSplit)",
        "quantity": "\(myConstant)"
     }
   }

"""

print(quotation)

// Arrays

var names = ["name 1", "name 2", "name 3", "name 4"]

names.append("new name")

let logNames = """

 names : \(names)
 lastName : \(names[names.count - 1])

"""

print(logNames)

// dictionaries "HashMap"

let dictionariesString = [
    "KEY_1" : "value 1",
    "KEY_2" : "value 2",
    "KEY_3" : "value 3",
]

let dictionariesGeneric: [String : Any] = [
    "123": "name",
    "data": 123,
]
 
print("value is: \(dictionariesGeneric["123"])")

// Control Flow

var name: String? = "my name is topperson"

let type = if name!.count > 10 {
    "BOOM"
} else {
    "NOOO"
}

if let _name = name {
    print("Value exist \(_name)")
}

name = nil

if let _ = name {
    print("none")
} else {
    print("name is nill")
}

var customName : String? = nil
let defautName: String = "Lucas"
print(" ")
print("current name is \(customName ?? defautName)")

customName = "the ninja"

if let customName {
    print("name find is \(customName)")
}

let typeTest : String = "ABqD"

switch typeTest {
    case let type where type.hasPrefix("AB"):
        print("Prefix está OK")
    case "ACD":
        print("ACD find")
    default:
        print("all ok")
}

let myDictionary = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var totalLenghtConctKey = 0
var totalSubItens = 0

for (key, value) in myDictionary {
    totalLenghtConctKey = key.count + totalLenghtConctKey
    for i in value {
        totalSubItens += 1
    }
}

print("")
print("Count key total : ", totalLenghtConctKey, " total sub itens : ", totalSubItens)

while totalSubItens > 1 {
    totalSubItens -= 1
}

print("total sub itens finished ", totalSubItens)

repeat {

      print("current value is ", totalSubItens)
      totalSubItens += 1
     
} while totalSubItens <= 10

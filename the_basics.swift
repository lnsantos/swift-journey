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


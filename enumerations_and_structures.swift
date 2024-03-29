enum CardType {
    case Normal, Premium, Platinum, Black
}
var type = CardType.Premium
type = .Premium

print(type)

func showDescription(type: CardType) {
    switch type {
        case .Normal:
            print("Your card is level 1")
        case .Premium:
            print("Your card is level 2")
        case .Platinum:
            print("Yout card is level 3")
        case .Black:
            print("Your card is level 4")            
    }
}

showDescription(type: CardType.Normal)

// Iterating over Enumeration Casesin page link
enum ItensType : CaseIterable {
    case Hat, Closure, Product
}

for type in ItensType.allCases {
    print(type)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
}

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
}

// Raw value
enum EnumRawString : String, CaseIterable {
    case Failed = "Failed your payment"
    case Success = "Success in payment"
}

for i in EnumRawString.allCases {
    print(i.rawValue)
}

enum EnumRawNative : String, CaseIterable {
    case About, Home
}

for i in EnumRawNative.allCases {
    print(i.rawValue)
}

let testInitRaw = EnumRawNative(rawValue: "About")
print(testInitRaw?.rawValue)

indirect enum Called {
    case number(x: Int)
    case sum(Called, Called)
    case multiplication(x: Int , value:Called)
}

func recursiveEnumerations() -> Int {
    let number10 = Called.number(x: 10)
    let number50 = Called.number(x: 50)
    let sum = Called.sum(number10, number50)
    let mult = Called.multiplication(x: 100, value: sum)

    func closureEvaluate(value: Called) -> Int {
        switch value {
            case let .number(x):
                return x
            case let .sum(x, y):
                return closureEvaluate(value: x) + closureEvaluate(value: y)
            case let .multiplication(x, c):
                 return x * closureEvaluate(value: c)
        }
    }

    return closureEvaluate(value: mult)
}

print(recursiveEnumerations())

// struct

enum Prefission : String, CaseIterable {
    case Developer, LamberJack
}

struct Person {
    let name: String
    let year: Int
    let prefission: Prefission

    func toJson() -> String {
        return """

         {
            "name": "\(name)",
            "year": \(year),
            "presission": "\(prefission.rawValue)"
         }

        """
    }
}

let p = Person(name: "Josh", year: 1999, prefission: .Developer)
print(p.toJson())
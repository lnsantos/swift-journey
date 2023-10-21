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
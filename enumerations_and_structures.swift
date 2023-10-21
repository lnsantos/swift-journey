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
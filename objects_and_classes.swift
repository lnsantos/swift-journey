let KEY_PWD = "ninja_extra"

class MyClassInSwift {

    private var extra: [String: Int] = [
       "ninja_extra": 10
    ]

    func search(key: String) -> Int {
        return extra[key] ?? -1
    }
}

let value = MyClassInSwift().search(key: KEY_PWD)
// print(value)

class Payment {

    private var methodType: Int? = nil

    init(methodType: Int) {
        self.methodType = methodType;
    }

    deinit {
        methodType = nil
    }

    func buy(price: Int) -> Bool {
        return price > 1000 && methodType == 1
    }
}

// print(Payment(methodType: 1).buy(price: 2000))

class PixPayment : Payment {

    private var value = 0
    init() {
        super.init(methodType: 1)
    }

    var price: Int {
        get {
            return if buy(price: value) { 1 } else { 0 }
        }
        set {
            value = newValue
        }
    }

    var observer: Int = -1 {
        willSet {
            print("willSet called")

            if newValue != observer {
                print("Outher value")
                self.observer = newValue
            } else {
                print("Some value ;-;")
            }
        }

        didSet {
            print("did set")
        }
    }
}


// print(PixPayment().buy(price: 2000))
let pix = PixPayment()
pix.price = 3000
print(pix.price)
pix.observer = 2000
pix.observer = 2000
protocol Human {
    var name: String? { get set }
    static var isLive: Bool { get set }
    
    func perform()
    func talk() 
}

class Woman : Human {
    var name: String? = "woman"
    static var isLive: Bool = true

    init(){ 
        print("start woman class")
    }

    func perform() {
        print("woman perform")    
    }

    func talk() {
        print("womam talk")
    }

    deinit {
        name = nil
    }
}

class Man : Human {
    var name: String? = "man"
    static var isLive: Bool = true

    init(){ 
        print("start man class")
    }

    func perform() {
        print("man perform")  
        name = name ?? "" + " perform"  
    }

    func talk() {
        print("man talk")
        name = name ?? "" + " talk"  
    }

    deinit {
        name = nil
    }
}

func testProtocol1() {

    let woman = Woman()
    let man = Man()

    woman.perform()
    man.perform()
    woman.talk()
    man.talk()
}

testProtocol1()

// mutate method test
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var p = Point(x: 10.0, y: 60.0)
print(p)
p.moveBy(x: 20.0, y: 90.0)
print(p)
p.moveBy(x: 123.00, y: 8003.00)
print(p)

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
        print(self)
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
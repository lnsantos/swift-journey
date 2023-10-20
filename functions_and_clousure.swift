func nameFunction(param1:String, param2:String) -> String {
    print("")
    return "\(param1) \(param2)"
}

print(nameFunction(param1: "Swift", param2: "Learning"))

func backlogRegister(index id: Int, type custom: String) -> String {
    print("")
    return "\(id) plus \(custom)"
}

print(backlogRegister(index: 1000, type: "ONLINE"))

func search(index: Int, data: [Int]) -> (a: Bool, b: Int) { 
    var left = 0
    var right = data.count - 1
    var mid = 0
    var steps = 1

    while left <= right {
        steps += 1
        mid = left + ((right - left) / 2)

        switch true {
        case index > data[mid]:
            left = mid + 1
            steps += 1 
        case index < data[mid]:
            right = mid - 1
            steps += 1
        case index == data[mid]:
            return (true, steps)         
        default:
            return (false, steps)  
        }
    }
    return (false, steps)  
}

let teste = search(index: 3, data: [0,1,2,3,4,5,6,7,8,9,10])

print(" - ")

if teste.a {
    print("number is find is ", teste.b, " steps")
} else {
    print("number not found in ", teste.b, " steps")
}

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())

print(" ")

func testExample(number: Int) -> ((String) -> Int) {
    let prop = number * number

    func proccess(data: String) -> Int {
        return prop + data.count
    }

    return proccess
}

print(testExample(number: 2000)("Name"))
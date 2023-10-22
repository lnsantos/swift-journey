
enum ResourceTyoe : Int {
    case JPG = 400
    case MP4 = 2000
    case PNG = 700
}

class Uri {
    
    private var uri : String? = nil

    init(uri : String) {
        self.uri = uri
    }

     func get() -> String {
        return if let uri { uri } else  { "" }
    }

    deinit {
        uri = nil
    }
}

func mainDownload() {

    let file = "https://file6.com"

    print("----")
    print("init download img")
    Task {
        let img = await initDownloadResource(type: .JPG, uri: Uri(uri: file))
        print("img finish")
        print("-----")

        if img { print("img download is success") } else { print("img not supported")}
    }
    print("online")
    print("----")
    print("init download mp4")
    Task {
        let mp4 = await initDownloadResource(type: .MP4, uri: Uri(uri: file))
        print("mp4 finish")
        print("-----")

        if mp4 { print("mp4 download is success") } else { print("mp4 not supported")}
    }
    print("online")
}

func asyncDownloadParallel() async {
    let file = "https://file6.com"

    print("----")
    print("init download")

    async let img = initDownloadResource(type: .JPG, uri: Uri(uri: file))
    async let mp4 = initDownloadResource(type: .MP4, uri: Uri(uri: file))
    async let png = initDownloadResource(type: .PNG, uri: Uri(uri: file))

    if await img { print("img download is success") } else { print("img not supported")}
    if await mp4 { print("mp4 download is success") } else { print("mp4 not supported")}
    if await png { print("PNG download is success") } else { print("png not supported")}
    
    print("online")
}

/* await taskGroupResource(type: ResourceTyoe, uris: [Uri]) { taskGroup in 
    for r in uris {
        taskGroup.addTask { await initDownloadResource(type: type, uri: r) }
    }
} */

func initDownloadResource(type: ResourceTyoe, uri: Uri) async -> Bool {
    
    print("meta-data: { 'bytes': \(type.rawValue), 'type': \(type), 'hasValue': \(type.hashValue) }")

    var currentBytes : Int = 0 {
        willSet {
            // print("current bytes \(newValue) in \(type.rawValue)")
        }
    }

    if consultSizeInWeb(uri: uri) > type.rawValue {
        return false
    } 

    func closureFallback(bytes: Int) -> Bool{
        currentBytes = bytes 
        return true 
    }

    let data = await onDownload(
        uri: uri.get(), 
        expectedBytes: type.rawValue, 
        fallbackStatus: closureFallback
    )
    print("meta-data : 'finish' \(type)")
    return data.status && data.error == nil
}

func onPushBytesStatusInServer(byte: Int) {
    print("init register bytes push")
    for _ in 0...500 {}
    print("finished register in POST web :: \(byte)")
}

func consultSizeInWeb(uri: Uri) -> Int {
    switch uri.get() {
        case "https://file1.com":
            return 15000
        case "https://file2.com":
            return 600       
        default:
            return 500
    }
}

func onDownload(uri: String, expectedBytes: Int, fallbackStatus: (Int) -> Bool ) async -> (status: Bool, error: String?) {
    
    for i in 0...expectedBytes {
       let _ =  fallbackStatus(i) 
    }

    return (true, nil)
}

// start test await/async
// mainDownload()
// await asyncDownloadParallel()

let jpg1 = Task { await initDownloadResource(type: .JPG, uri: Uri(uri: "file")) }
let jpg2 = Task { await initDownloadResource(type: .JPG, uri: Uri(uri: "file")) }
let jpg3 = Task { await initDownloadResource(type: .JPG, uri: Uri(uri: "file")) }

print(await jpg1.value)
print(await jpg2.value)
print(await jpg3.value)

actor CurrentShow {
    let file: String
    var history: [String]

    init(_file: String) {
        self.file = _file
        self.history = [_file]
    }
}

extension CurrentShow {
    func reset() {
        history = []
    }
    func add(file: String) {
        history.append(file)
    }
}

let show = CurrentShow(_file: "abc")
await show.add(file:"abc")

print(await show.history)
await show.reset()

print(await show.history)

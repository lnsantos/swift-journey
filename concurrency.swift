
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

func mainDownload() async {

    let file = "https://file6.com"

    print("----")
    print("init download img")

    let img = await initDownloadResource(type: .JPG, uri: Uri(uri: file))
    print("img start")
    print("-----")

    if img { print("img download is success") } else { print("img not supported")}
}

func initDownloadResource(type: ResourceTyoe, uri: Uri) async -> Bool {
    
    print("meta-data: { 'bytes': \(type.rawValue), 'type': \(type), 'hasValue': \(type.hashValue) }")

    var currentBytes : Int = 0 {
        willSet {
            print("current bytes \(newValue) in \(type.rawValue)")
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
            return 300
    }
}

func onDownload(uri: String, expectedBytes: Int, fallbackStatus: (Int) -> Bool ) async -> (status: Bool, error: String?) {
    
    for i in 0...expectedBytes {
       let _ =  fallbackStatus(i) 
    }

    return (true, nil)
}

// start test await/async
Task {
   await mainDownload()
}

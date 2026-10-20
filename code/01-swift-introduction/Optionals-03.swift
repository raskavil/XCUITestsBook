var nickname: String? = "Tess"

if let name = nickname {
    print("Hello, \(name)")
} else {
    print("Hello, tester")
}

let displayName = nickname ?? "tester"
print("Logged in as \(displayName)")

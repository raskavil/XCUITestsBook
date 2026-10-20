func greeting(for name: String) -> String {
    return "Hello, \(name)"
}

func isValidEmail(_ email: String) -> Bool {
    if email.isEmpty || email.contains(" ") {
        return false
    }
    return email.contains("@") && email.contains(".")
}

let emails = ["tester@example.com", "tester.example.com", "tester@", "tester @example.com"]

for email in emails {
    print("\(email): \(isValidEmail(email))")
}

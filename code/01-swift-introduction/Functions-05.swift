func greeting(for name: String) -> String {
    return "Hello, \(name)"
}

func isValidEmail(_ email: String) -> Bool {
    if email.isEmpty || email.contains(" ") {
        return false
    }
    return email.contains("@") && email.contains(".")
}

print(isValidEmail("tester@example.com"))
print(isValidEmail("tester.example.com"))
print(isValidEmail("tester@"))
print(isValidEmail("tester @example.com"))

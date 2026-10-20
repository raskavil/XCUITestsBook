func greeting(for name: String) -> String {
    return "Hello, \(name)"
}

func isValidEmail(_ email: String) -> Bool {
    return email.contains("@") && email.contains(".")
}

print(isValidEmail("tester@example.com"))
print(isValidEmail("tester.example.com"))
print(isValidEmail("tester@"))

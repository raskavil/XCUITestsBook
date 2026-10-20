func isValidEmail(_ email: String) -> Bool {
    if email.isEmpty || email.contains(" ") {
        return false
    }
    return email.contains("@") && email.contains(".")
}

let signUps = ["ana@example.com", "bob.example.com", "@nouser", "cy@example.org", "", "dee @example.com"]

var invalid: [String] = []
for email in signUps {
    if !isValidEmail(email) {
        invalid.append(email)
    }
}
print("Invalid: \(invalid)")

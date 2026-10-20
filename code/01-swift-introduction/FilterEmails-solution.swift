func isValidEmail(_ email: String) -> Bool {
    if email.isEmpty || email.contains(" ") {
        return false
    }
    return email.contains("@") && email.contains(".")
}

let signUps = ["ana@example.com", "bob.example.com", "@nouser", "cy@example.org", "", "dee @example.com"]

let invalid = signUps.filter { email in
    !isValidEmail(email)
}
print("Invalid: \(invalid)")

let valid = signUps.filter(isValidEmail)
print("Valid: \(valid.count)")

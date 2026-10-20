enum Role {
    case admin, user, guest
}

struct TestUser {
    let name: String
    let email: String
    let role: Role
}

func makeUser(_ name: String, role: Role) -> TestUser {
    return TestUser(name: name, email: "\(name)@example.com", role: role)
}

func isValidEmail(_ email: String) -> Bool {
    if email.isEmpty || email.contains(" ") {
        return false
    }
    return email.contains("@") && email.contains(".")
}

var users: [TestUser] = []
for name in ["ana", "cy", "dee", "eve"] {
    users.append(makeUser(name, role: .user))
}
users.append(makeUser("lead", role: .admin))
users.append(makeUser("ops", role: .admin))
users.append(TestUser(name: "bob", email: "bob.example.com", role: .guest))
users.append(TestUser(name: "nouser", email: "@nouser", role: .guest))

var invalid: [String] = []
for user in users {
    if !isValidEmail(user.email) {
        invalid.append(user.email)
    }
}

print("Users: \(users.count)")
print("Valid emails: \(users.count - invalid.count)")
print("Invalid: \(invalid.joined(separator: ", "))")

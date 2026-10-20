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

func report(for users: [TestUser]) -> [String] {
    var invalid: [String] = []
    var admins = 0
    var regulars = 0
    var guests = 0
    for user in users {
        if !isValidEmail(user.email) {
            invalid.append(user.email)
        }
        if user.role == .admin {
            admins = admins + 1
        } else if user.role == .user {
            regulars = regulars + 1
        } else {
            guests = guests + 1
        }
    }
    return [
        "Users: \(users.count)",
        "Valid emails: \(users.count - invalid.count)",
        "Invalid: \(invalid.joined(separator: ", "))",
        "By role: admin \(admins), user \(regulars), guest \(guests)",
    ]
}

var users: [TestUser] = []
for name in ["ana", "cy", "dee", "eve"] {
    users.append(makeUser(name, role: .user))
}
users.append(makeUser("lead", role: .admin))
users.append(makeUser("ops", role: .admin))
users.append(TestUser(name: "bob", email: "bob.example.com", role: .guest))
users.append(TestUser(name: "nouser", email: "@nouser", role: .guest))

for line in report(for: users) {
    print(line)
}

for number in 1...10 {
    users.append(makeUser("guest\(number)", role: .guest))
}

print("---")
for line in report(for: users) {
    print(line)
}

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

var users: [TestUser] = []
for name in ["ana", "cy", "dee", "eve"] {
    users.append(makeUser(name, role: .user))
}
users.append(makeUser("lead", role: .admin))
users.append(makeUser("ops", role: .admin))
users.append(TestUser(name: "bob", email: "bob.example.com", role: .guest))
users.append(TestUser(name: "nouser", email: "@nouser", role: .guest))

print("Users: \(users.count)")

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

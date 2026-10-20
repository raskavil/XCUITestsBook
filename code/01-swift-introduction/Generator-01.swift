enum Role {
    case admin, user, guest
}

struct TestUser {
    let name: String
    let email: String
    let role: Role
}

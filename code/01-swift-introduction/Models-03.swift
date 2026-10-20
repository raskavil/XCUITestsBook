enum Role {
    case admin, user, guest
}

struct TestUser {
    let name: String
    let email: String
    let role: Role
}

let users = [
    TestUser(name: "tester", email: "tester@example.com", role: .user),
    TestUser(name: "qa.lead", email: "lead@example.com", role: .admin),
    TestUser(name: "visitor", email: "visitor@example.com", role: .guest),
]

for user in users {
    if user.role == .admin {
        print("\(user.name) can delete tasks")
    }
}

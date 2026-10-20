enum Role {
    case admin, user, guest
}

struct TestUser {
    let name: String
    let email: String
    let role: Role
}

let tester = TestUser(name: "tester", email: "tester@example.com", role: .user)
let lead = TestUser(name: "qa.lead", email: "lead@example.com", role: .admin)
print(tester.role)
print(lead.role)

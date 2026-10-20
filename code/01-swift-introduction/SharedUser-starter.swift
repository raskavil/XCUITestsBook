// Two tests start from the same template user and change their own copy.
// The output is wrong. Find out why and fix it.

enum Role {
    case admin, user, guest
}

class TestUser {
    var name: String
    var role: Role

    init(name: String, role: Role) {
        self.name = name
        self.role = role
    }
}

let template = TestUser(name: "tester", role: .user)

let adminUser = template
adminUser.role = .admin

let guestUser = template
guestUser.role = .guest

print("Admin test runs as: \(adminUser.role)")   // expected: admin
print("Guest test runs as: \(guestUser.role)")   // expected: guest
print("Template is still: \(template.role)")     // expected: user

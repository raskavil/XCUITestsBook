// Two tests start from the same template user and change their own copy.
// The output is wrong. Find out why and fix it.

enum Role {
    case admin, user, guest
}

struct TestUser {
    var name: String
    var role: Role
}

let template = TestUser(name: "tester", role: .user)

var adminUser = template
adminUser.role = .admin

var guestUser = template
guestUser.role = .guest

print("Admin test runs as: \(adminUser.role)")   // expected: admin
print("Guest test runs as: \(guestUser.role)")   // expected: guest
print("Template is still: \(template.role)")     // expected: user

// Test data for the login checks.
// This playground does not compile. Fix every error without deleting a line.

let validUser = "tester"
let validPassword = "password123"
let lockedUser = "locked.user"

let maxAttempts: Int = 5
var attemptsLeft = maxAttempts

print("Valid user: " + validUser)
print("Locked user: " + lockedUser)

attemptsLeft = attemptsLeft - 1
print(attemptsLeft)

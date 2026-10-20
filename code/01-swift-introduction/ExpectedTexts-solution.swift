// Expected texts for the login screen, built from the test data.
// Fill in each expected text using the constants. Do not type "tester" or any number again.

let username = "tester"
let maxAttempts = 5
let failedAttempts = 2

let expectedWelcome = "Welcome back, \(username)"
let expectedWarning = "\(username) has \(maxAttempts - failedAttempts) attempts left"
let expectedLimit = "Limit: \(maxAttempts)"

print(expectedWelcome)
print(expectedWarning)
print(expectedLimit)

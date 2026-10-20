import Foundation

/// Checks the login form and remembers who is logged in.
final class LoginService {
    enum LoginError {
        case emptyUsername
        case wrongPassword
    }

    private let knownUsers = ["tester": "password123"]
    private(set) var currentUser: String?

    static let usernameFieldID = "login.usernameField"
    static let passwordFieldID = "login.passwordField"
    static let errorLabelID = "login.errorLabel"

    /// Returns nil on success, or the reason the login failed.
    func login(username: String, password: String) -> LoginError? {
        guard !username.isEmpty else {
            return .emptyUsername
        }
        guard knownUsers[username] == password else {
            return .wrongPassword
        }
        currentUser = username
        return nil
    }

    func errorMessage(for error: LoginError) -> String {
        switch error {
        case .emptyUsername: return "Enter your username."
        case .wrongPassword: return "Wrong username or password."
        }
    }
}

import UIKit

final class LoginViewController: UIViewController {
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let errorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        loginButton.setTitle("Log in", for: .normal)
        errorLabel.textColor = .systemRed
    }
}

import UIKit

final class LoginViewController: UIViewController {
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let errorLabel = UILabel()
    private let logoView = UIImageView(image: UIImage(systemName: "checklist"))

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
        logoView.contentMode = .scaleAspectFit

        usernameField.accessibilityIdentifier = "login.usernameField"
        passwordField.accessibilityIdentifier = "login.passwordField"
        loginButton.accessibilityIdentifier = "login.loginButton"
        errorLabel.accessibilityIdentifier = "login.errorLabel"
        logoView.accessibilityIdentifier = "login.logo"
        logoView.isAccessibilityElement = true
        logoView.accessibilityLabel = "TaskBoard logo"

        let stack = UIStackView(arrangedSubviews: [logoView, usernameField, passwordField, loginButton, errorLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])

        loginButton.addAction(UIAction { [weak self] _ in self?.logIn() }, for: .touchUpInside)
    }

    private func logIn() {
        let username = usernameField.text ?? ""
        errorLabel.text = "No account for \(username)"
    }
}

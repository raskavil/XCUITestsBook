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
        errorLabel.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [usernameField, passwordField, loginButton, errorLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        let fullWidth = stack.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor)
        fullWidth.priority = .defaultHigh
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stack.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
            stack.widthAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.widthAnchor),
            fullWidth,
            loginButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
        ])

        loginButton.addAction(UIAction { [weak self] _ in self?.logIn() }, for: .touchUpInside)
    }

    private func logIn() {
        let username = usernameField.text ?? ""
        errorLabel.text = "No account for \(username)"
    }
}

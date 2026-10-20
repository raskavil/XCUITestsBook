import UIKit

final class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to TaskBoard"

        let usernameField = UITextField()
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect

        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Log in", for: .normal)

        let rememberSwitch = UISwitch()
        rememberSwitch.isOn = true

        let stack = UIStackView(arrangedSubviews: [welcomeLabel, usernameField, passwordField, loginButton, rememberSwitch])
        stack.axis = .vertical
        stack.spacing = 12
        stack.frame = CGRect(x: 20, y: 140, width: 350, height: 320)
        view.addSubview(stack)
    }
}

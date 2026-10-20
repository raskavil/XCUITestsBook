import UIKit

/// Sign-up screen. Build the form described in the challenge.
final class SignUpViewController: UIViewController {
    private let termsSwitch = UISwitch()
    private let createButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sign up"

        let heading = UILabel()
        heading.text = "Create your account"
        heading.font = .preferredFont(forTextStyle: .title2)

        let emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress

        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        let confirmField = UITextField()
        confirmField.placeholder = "Confirm password"
        confirmField.borderStyle = .roundedRect
        confirmField.isSecureTextEntry = true

        let termsLabel = UILabel()
        termsLabel.text = "I accept the terms"
        termsSwitch.isOn = false
        let termsRow = UIStackView(arrangedSubviews: [termsLabel, termsSwitch])

        createButton.setTitle("Create account", for: .normal)
        createButton.isEnabled = false
        termsSwitch.addAction(UIAction { [weak self] _ in self?.updateCreateButton() }, for: .valueChanged)

        let stack = UIStackView(arrangedSubviews: [heading, emailField, passwordField, confirmField, termsRow, createButton])
        stack.axis = .vertical
        stack.spacing = 12
        stack.frame = CGRect(x: 20, y: 140, width: 350, height: 320)
        view.addSubview(stack)
    }

    private func updateCreateButton() {
        createButton.isEnabled = termsSwitch.isOn
    }
}

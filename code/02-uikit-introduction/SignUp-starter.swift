import UIKit

/// Sign-up screen. Build the form described in the challenge.
final class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sign up"

        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .vertical
        stack.spacing = 12
        stack.frame = CGRect(x: 20, y: 140, width: 350, height: 320)
        view.addSubview(stack)
    }
}

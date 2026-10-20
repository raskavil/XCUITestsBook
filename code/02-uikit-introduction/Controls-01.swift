import UIKit

final class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to TaskBoard"

        let stack = UIStackView(arrangedSubviews: [welcomeLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.frame = CGRect(x: 20, y: 140, width: 350, height: 320)
        view.addSubview(stack)
    }
}

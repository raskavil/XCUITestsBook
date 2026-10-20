import UIKit

final class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        let card = UIView(frame: CGRect(x: 20, y: 140, width: 350, height: 200))
        card.backgroundColor = .secondarySystemBackground
        view.addSubview(card)

        let welcome = UILabel(frame: CGRect(x: 16, y: 16, width: 300, height: 30))
        welcome.text = "Welcome to TaskBoard"
        card.addSubview(welcome)

        card.isHidden = true
    }
}

import UIKit

final class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        let banner = UIView(frame: CGRect(x: 20, y: 120, width: 350, height: 44))
        banner.backgroundColor = .systemYellow
        view.addSubview(banner)

        let bannerLabel = UILabel(frame: CGRect(x: 12, y: 8, width: 320, height: 28))
        bannerLabel.text = "Test environment"
        banner.addSubview(bannerLabel)

        let footer = UIView(frame: CGRect(x: 20, y: 600, width: 350, height: 0))
        footer.clipsToBounds = true
        view.addSubview(footer)

        let forgotLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 30))
        forgotLabel.text = "Forgot your password?"
        footer.addSubview(forgotLabel)

        let background = UIView(frame: CGRect(x: 20, y: 110, width: 350, height: 64))
        background.backgroundColor = .systemBackground
        view.addSubview(background)
    }
}

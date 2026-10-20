import UIKit

final class LoginViewController: UIViewController {
    private let showTasksButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Log in"

        showTasksButton.setTitle("Show tasks", for: .normal)
        showTasksButton.frame = CGRect(x: 20, y: 140, width: 350, height: 44)
        showTasksButton.addAction(UIAction { [weak self] _ in self?.showTasks() }, for: .touchUpInside)
        view.addSubview(showTasksButton)
    }

    private func showTasks() {
        navigationController?.pushViewController(TaskListViewController(), animated: true)
    }
}

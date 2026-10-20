import UIKit

/// Presented from the task list like this:
///     let filter = UINavigationController(rootViewController: FilterViewController())
///     filter.modalPresentationStyle = .fullScreen
///     present(filter, animated: true)
final class FilterViewController: UIViewController {
    private let showDoneSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Filter"

        let label = UILabel()
        label.text = "Show done tasks"
        showDoneSwitch.isOn = true

        let row = UIStackView(arrangedSubviews: [label, showDoneSwitch])
        row.frame = CGRect(x: 20, y: 140, width: 350, height: 44)
        view.addSubview(row)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .done,
            primaryAction: UIAction { [weak self] _ in self?.done() }
        )
    }

    private func done() {
        print("Filter: show done tasks = \(showDoneSwitch.isOn)")
        dismiss(animated: true)
    }
}

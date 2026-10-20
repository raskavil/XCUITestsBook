import UIKit

final class TaskDetailViewController: UIViewController {
    private let task: TaskItem
    private let titleLabel = UILabel()
    private let doneBadge = UIView()

    init(task: TaskItem) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("TaskBoard does not use storyboards")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Task"

        titleLabel.text = task.title
        titleLabel.accessibilityIdentifier = "taskDetail.titleLabel"

        doneBadge.backgroundColor = task.isDone ? .systemGreen : .systemGray4
        doneBadge.layer.cornerRadius = 8
        doneBadge.accessibilityIdentifier = "taskDetail.doneBadge"

        let header = UIStackView(arrangedSubviews: [doneBadge, titleLabel])
        header.spacing = 8
        header.alignment = .center
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        NSLayoutConstraint.activate([
            doneBadge.widthAnchor.constraint(equalToConstant: 16),
            doneBadge.heightAnchor.constraint(equalToConstant: 16),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            header.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}

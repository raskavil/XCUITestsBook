import UIKit

final class TaskDetailViewController: UIViewController {
    private let task: TaskItem
    private let titleLabel = UILabel()
    private let notesLabel = UILabel()

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
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        notesLabel.text = task.notes
        notesLabel.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [titleLabel, notesLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}

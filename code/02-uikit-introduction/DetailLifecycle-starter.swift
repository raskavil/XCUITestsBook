import UIKit

final class TaskDetailViewController: UIViewController {
    private let task: TaskItem
    private let titleLabel = UILabel()

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
        titleLabel.frame = CGRect(x: 20, y: 120, width: 350, height: 30)
        view.addSubview(titleLabel)
        print("Detail \(task.id): viewDidLoad")
    }
}

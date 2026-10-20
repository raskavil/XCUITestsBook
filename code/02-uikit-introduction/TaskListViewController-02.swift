import UIKit

final class TaskListViewController: UITableViewController {
    private let store = TaskStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasks"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .add,
            primaryAction: UIAction { [weak self] _ in self?.showAddTask() }
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        store.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = store.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content
        cell.accessoryType = task.isDone ? .checkmark : .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = store.tasks[indexPath.row]
        navigationController?.pushViewController(TaskDetailViewController(task: task), animated: true)
    }

    private func showAddTask() {
        let addTask = UINavigationController(rootViewController: AddTaskViewController())
        present(addTask, animated: true)
    }
}

import UIKit

// MARK: - AddTaskViewController.swift

final class AddTaskViewController: UIViewController {
    var onSave: (() -> Void)?

    private let titleField = UITextField()
    private let notesField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "New task"

        titleField.placeholder = "Title"
        titleField.borderStyle = .roundedRect
        notesField.placeholder = "Notes"
        notesField.borderStyle = .roundedRect
        titleField.accessibilityIdentifier = "addTask.titleField"
        notesField.accessibilityIdentifier = "addTask.notesField"
        titleField.addAction(UIAction { [weak self] _ in self?.updateSaveButton() }, for: .editingChanged)

        let cancelButton = UIBarButtonItem(
            systemItem: .cancel,
            primaryAction: UIAction { [weak self] _ in self?.dismiss(animated: true) }
        )
        cancelButton.accessibilityIdentifier = "addTask.cancelButton"
        let saveButton = UIBarButtonItem(
            systemItem: .save,
            primaryAction: UIAction { [weak self] _ in self?.save() }
        )
        saveButton.accessibilityIdentifier = "addTask.saveButton"
        saveButton.isEnabled = false
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton

        let stack = UIStackView(arrangedSubviews: [titleField, notesField])
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

    private func updateSaveButton() {
        navigationItem.rightBarButtonItem?.isEnabled = !(titleField.text ?? "").isEmpty
    }

    private func save() {
        TaskStore.shared.add(title: titleField.text ?? "", notes: notesField.text ?? "")
        onSave?()
        dismiss(animated: true)
    }
}

// MARK: - TaskListViewController.swift

final class TaskListViewController: UITableViewController {
    private let store = TaskStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasks"
        tableView.accessibilityIdentifier = "taskList.table"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")

        let addButton = UIBarButtonItem(
            systemItem: .add,
            primaryAction: UIAction { [weak self] _ in self?.showAddTask() }
        )
        addButton.accessibilityIdentifier = "taskList.addButton"
        navigationItem.rightBarButtonItem = addButton
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
        cell.accessibilityIdentifier = "taskList.cell.\(task.id)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = store.tasks[indexPath.row]
        navigationController?.pushViewController(TaskDetailViewController(task: task), animated: true)
    }

    private func showAddTask() {
        let addTask = AddTaskViewController()
        addTask.onSave = { [weak self] in self?.tableView.reloadData() }
        present(UINavigationController(rootViewController: addTask), animated: true)
    }
}

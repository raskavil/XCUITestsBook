import Foundation

struct TaskItem {
    let id: Int
    var title: String
    var notes: String
    var isDone: Bool
}

/// Keeps the tasks in memory. Every launch starts from the same three tasks.
@MainActor
final class TaskStore {
    static let shared = TaskStore()

    private(set) var tasks: [TaskItem] = [
        TaskItem(id: 1, title: "Write login test plan", notes: "Cover a valid login, a wrong password and empty fields.", isDone: false),
        TaskItem(id: 2, title: "Review crash report", notes: "The app crashes on Task detail after rotating.", isDone: false),
        TaskItem(id: 3, title: "Update test devices", notes: "Install the latest iOS on both test phones.", isDone: true),
    ]

    func add(title: String, notes: String) {
        let nextID = (tasks.map { $0.id }.max() ?? 0) + 1
        tasks.append(TaskItem(id: nextID, title: title, notes: notes, isDone: false))
    }

    func setDone(_ isDone: Bool, forTaskWithID id: Int) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isDone = isDone
    }
}

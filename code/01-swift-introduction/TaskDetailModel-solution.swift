import Foundation

// MARK: - App code (do not change)

struct TaskItem {
    let id: Int
    var title: String
    var notes: String
    var isDone: Bool
}

final class TaskDetailModel {
    enum EditError: Error {
        case emptyTitle
        case alreadyDone
    }

    private(set) var task: TaskItem
    private let maxTitleLength = 60

    let titleLabelID = "taskDetail.titleLabel"
    let notesLabelID = "taskDetail.notesLabel"
    let doneSwitchID = "taskDetail.doneSwitch"

    init(task: TaskItem) {
        self.task = task
    }

    func rename(to newTitle: String) throws {
        guard !newTitle.isEmpty else { throw EditError.emptyTitle }
        task.title = String(newTitle.prefix(maxTitleLength))
    }

    func markDone() throws {
        guard !task.isDone else { throw EditError.alreadyDone }
        task.isDone = true
    }
}

// MARK: - Your answers

// 1. Every accessibility identifier in this file, in order:
let identifiers: [String] = ["taskDetail.titleLabel", "taskDetail.notesLabel", "taskDetail.doneSwitch"]

// 2. Which error can markDone() throw, and when?
// EditError.alreadyDone, when the task is already done.

// 3. Can code outside TaskDetailModel write `model.task.title = "New"`? Why?
// No. `task` is private(set): anyone can read it, only TaskDetailModel can change it.

// 4. What happens to a title that is 100 characters long?
// rename(to:) keeps only the first 60 characters (maxTitleLength).

enum Screen: String {
    case login = "Log in"
    case taskList = "Tasks"
    case taskDetail = "Task"
    case addTask = "New task"
}

let current = Screen.taskList
print("Expected title: \(current.rawValue)")

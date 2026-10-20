enum Screen: String {
    case login = "Log in"
    case taskList = "Tasks"
    case taskDetail = "Task"
    case addTask = "New task"
}

let current = Screen.taskList
print("Expected title: \(current.rawValue)")

struct Visit {
    let screen: Screen
    var seconds: Int
}

var visit = Visit(screen: .taskList, seconds: 3)
visit.seconds = visit.seconds + 2
print("\(visit.screen.rawValue): \(visit.seconds)s")

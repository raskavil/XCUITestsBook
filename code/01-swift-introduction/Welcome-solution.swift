// Builds the welcome text the task list shows after login.
// Rewrite it with guard let so the happy path is not nested. Behaviour must not change.

func welcomeText(username: String?, taskCount: String?) -> String {
    guard let name = username else {
        return "Please log in."
    }
    guard let countText = taskCount, let count = Int(countText) else {
        return "Welcome, \(name)."
    }
    return "Welcome, \(name). You have \(count) tasks."
}

print(welcomeText(username: "tester", taskCount: "3"))
print(welcomeText(username: "tester", taskCount: nil))
print(welcomeText(username: "tester", taskCount: "three"))
print(welcomeText(username: nil, taskCount: "3"))

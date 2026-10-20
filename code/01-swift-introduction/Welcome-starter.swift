// Builds the welcome text the task list shows after login.
// Rewrite it with guard let so the happy path is not nested. Behaviour must not change.

func welcomeText(username: String?, taskCount: String?) -> String {
    if let name = username {
        if let countText = taskCount {
            if let count = Int(countText) {
                return "Welcome, \(name). You have \(count) tasks."
            } else {
                return "Welcome, \(name)."
            }
        } else {
            return "Welcome, \(name)."
        }
    } else {
        return "Please log in."
    }
}

print(welcomeText(username: "tester", taskCount: "3"))
print(welcomeText(username: "tester", taskCount: nil))
print(welcomeText(username: "tester", taskCount: "three"))
print(welcomeText(username: nil, taskCount: "3"))

// Screens a tester visited during one exploratory session, in order.
let visits = ["Login", "Task list", "Task detail", "Task list", "Task detail",
              "Task list", "Settings", "Login"]

// 1. Print how many different screens were visited.
let differentScreens = Set(visits)
print("Different screens: \(differentScreens.count)")

// 2. Print how many times each screen was visited.
var visitCounts: [String: Int] = [:]
for screen in visits {
    visitCounts[screen, default: 0] += 1
}
for (screen, count) in visitCounts {
    print("\(screen): \(count)")
}

// 3. Print whether "Add task" was visited at all.
print("Add task visited: \(differentScreens.contains("Add task"))")

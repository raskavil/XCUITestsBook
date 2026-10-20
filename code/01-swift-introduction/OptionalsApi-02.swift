let screens = ["Login", "Task list", "Task detail"]

if let first = screens.first {
    print("The app starts on \(first)")
}

let typedCount = Int("3")
print(typedCount ?? 0)

let emptyList: [String] = []
print(emptyList.first!)

let screens = ["Login", "Task list", "Task detail", "Add task", "Settings"]

for screen in screens {
    print("Open \(screen) and check the title")
}

var invalidEmails = ["", "tester", "tester@", "@example.com", "tester example.com"]
invalidEmails.append("tester@@example.com")

for email in invalidEmails {
    print("Type '\(email)' and expect an error")
}

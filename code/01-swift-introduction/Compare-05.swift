let expectedTaskCount = 3
let actualTaskCount = 2
let expectedTitle = "Tasks"
let actualTitle = "Tasks"

if actualTitle != expectedTitle {
    print("FAIL: wrong screen, title is \(actualTitle)")
} else if actualTaskCount != expectedTaskCount {
    print("FAIL: expected \(expectedTaskCount) tasks, got \(actualTaskCount)")
} else {
    print("PASS")
}

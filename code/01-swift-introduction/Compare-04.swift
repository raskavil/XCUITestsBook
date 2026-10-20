let expectedTaskCount = 3
let actualTaskCount = 2
let expectedTitle = "Tasks"
let actualTitle = "Tasks"

if actualTaskCount == expectedTaskCount && actualTitle == expectedTitle {
    print("PASS")
} else {
    print("FAIL: expected \(expectedTaskCount), got \(actualTaskCount)")
}

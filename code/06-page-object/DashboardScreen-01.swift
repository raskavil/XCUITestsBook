import XCTest

struct DashboardScreen {
    let app: XCUIApplication

    var root: XCUIElement { app.otherElements["dashboard.root"] }

    var isVisible: Bool {
        root.waitForExistence(timeout: 5)
    }
}

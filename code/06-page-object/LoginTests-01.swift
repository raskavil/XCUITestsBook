import XCTest

final class LoginTests: XCTestCase {
    func testValidLoginShowsDashboard() {
        let app = XCUIApplication()
        app.launch()

        app.textFields["login.email"].tap()
        app.textFields["login.email"].typeText("demo@example.com")
        app.secureTextFields["login.password"].tap()
        app.secureTextFields["login.password"].typeText("correct-horse")
        app.buttons["login.submit"].tap()

        XCTAssertTrue(app.otherElements["dashboard.root"].waitForExistence(timeout: 5))
    }
}

import XCTest

final class LoginTests: XCTestCase {
    func testValidLoginShowsDashboard() {
        let app = XCUIApplication()
        app.launch()

        let dashboard = LoginScreen(app: app)
            .logIn(email: "demo@example.com", password: "correct-horse")

        XCTAssertTrue(dashboard.isVisible)
    }
}

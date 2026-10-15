import XCTest

struct LoginScreen {
    let app: XCUIApplication

    var email: XCUIElement { app.textFields["login.email"] }
    var password: XCUIElement { app.secureTextFields["login.password"] }
    var submit: XCUIElement { app.buttons["login.submit"] }

    var isVisible: Bool {
        email.waitForExistence(timeout: 5)
    }

    @discardableResult
    func logIn(email address: String, password secret: String) -> DashboardScreen {
        email.tap()
        email.typeText(address)
        password.tap()
        password.typeText(secret)
        submit.tap()
        return DashboardScreen(app: app)
    }
}

import XCTest

struct LoginScreen {
    let app: XCUIApplication

    var email: XCUIElement { app.textFields["login.email"] }
    var password: XCUIElement { app.secureTextFields["login.password"] }
    var submit: XCUIElement { app.buttons["login.submit"] }

    var isVisible: Bool {
        email.waitForExistence(timeout: 5)
    }
}

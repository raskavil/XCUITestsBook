import XCTest

final class SettingsTests: XCTestCase {
    func testTurningOffNotificationsShowsConfirmation() {
        let app = XCUIApplication()
        app.launch()

        app.tabBars.buttons["tab.settings"].tap()
        XCTAssertTrue(app.otherElements["settings.root"].waitForExistence(timeout: 5))

        let toggle = app.switches["settings.notifications"]
        XCTAssertEqual(toggle.value as? String, "1")

        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "0")

        XCTAssertTrue(
            app.staticTexts["settings.notifications.confirmation"].waitForExistence(timeout: 2)
        )
    }
}

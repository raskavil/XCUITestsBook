import XCTest

struct SettingsScreen {
    let app: XCUIApplication

    var root: XCUIElement { app.otherElements["settings.root"] }
    var notificationsSwitch: XCUIElement { app.switches["settings.notifications"] }
    var confirmation: XCUIElement { app.staticTexts["settings.notifications.confirmation"] }

    var isVisible: Bool { root.waitForExistence(timeout: 5) }
    var notificationsAreOn: Bool { notificationsSwitch.value as? String == "1" }

    static func open(in app: XCUIApplication) -> SettingsScreen {
        app.tabBars.buttons["tab.settings"].tap()
        return SettingsScreen(app: app)
    }

    @discardableResult
    func toggleNotifications() -> SettingsScreen {
        notificationsSwitch.tap()
        return self
    }
}

final class SettingsTests: XCTestCase {
    func testTurningOffNotificationsShowsConfirmation() {
        let app = XCUIApplication()
        app.launch()

        let settings = SettingsScreen.open(in: app)
        XCTAssertTrue(settings.isVisible)
        XCTAssertTrue(settings.notificationsAreOn)

        settings.toggleNotifications()

        XCTAssertFalse(settings.notificationsAreOn)
        XCTAssertTrue(settings.confirmation.waitForExistence(timeout: 2))
    }
}

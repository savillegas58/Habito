//
//  NavigationUITests.swift
//  HabitoUITests
//
//  Created by Saul on 2/18/25.
//

import XCTest

final class NavigationUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testNotificationButtonShowsNotificationsView() {

        let notificationButton = app.buttons["NotificationButton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: notificationButton, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(notificationButton.exists, "The Notification button should exist")

        notificationButton.tap()

    
        let notificationView = app.otherElements["NotificationsView"]
        XCTAssertTrue(notificationView.exists, "The Notifications view should appear after tapping the button")
    }
    
    
    func testNotificationXMarkButtonRemovesNotificationsView() {

        let notificationXMarkButton = app.buttons["NotificationXMarkButton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: notificationXMarkButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(notificationXMarkButton.exists, "The Notification button should exist")

        notificationXMarkButton.tap()

    
        let notificationView = app.otherElements["NotificationsView"]
        XCTAssertFalse(notificationView.exists, "The Notifications view should disappear after tapping the button")
    }
    
    func testCentralButtonShowsCentralView() {

        let centralButton = app.buttons["centralPlusButton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: centralButton, handler: nil)
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertTrue(centralButton.exists, "The Central Plus button should exist")
        
        centralButton.tap()
        
        let centralView = app.otherElements["CreateNewHabitView"]
        XCTAssertTrue(centralView.exists, "The CreateNewHabitView should appear after tapping the button")
        
    }
    
    func testArrowButtonShowsOnboarding2View(){
        
        let arrowButton = app.buttons["arrowbutton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: arrowButton, handler: nil)
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertTrue(arrowButton.exists, "The arrow button should exist")
        
        arrowButton.tap()
        
        let onboarding2View = app.otherElements["Onboarding2View"]
        XCTAssertTrue(onboarding2View.exists, "The onboarding2View should exist")
        
    }
    
    func testLogoutButtonShowsOnBoardingView(){
        
        
        let logOutButton = app.buttons["logoutButton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: logOutButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(logOutButton.exists, "The Logout button does not exist")

        logOutButton.tap()

    
        let notificationView = app.otherElements["Onboarding1"]
        XCTAssertTrue(notificationView.exists, "The Onboarding1 view did not show after pressing the Logout button")
        
        
    }
    
    
    func testDetailsDoneButtonShowsPopUpView() {

        let detailsDoneButton = app.buttons["DetailsDoneButton"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: detailsDoneButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(detailsDoneButton.exists, "The Details Done button should exist")

        detailsDoneButton.tap()

    
        let popUpView = app.otherElements["popUpView"]
        XCTAssertTrue(popUpView.exists, "The popUpView should appear after tapping the button")
    }
    
}

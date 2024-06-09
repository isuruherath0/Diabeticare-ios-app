//
//  IT21041648UITests.swift
//  IT21041648UITests
//
//  Created by Isuru Herath on 2024-06-07.
//

import XCTest

final class IT21041648UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

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
    
    func testMapView() throws {
           let app = XCUIApplication()
           app.launch()

           // Navigate to the MapView
           let tabBar = app.tabBars["Tab Bar"]
           tabBar.buttons["Map"].tap()

           // Check if the map exists
           XCTAssertTrue(app.maps.element.exists)
       }
    
    func testManagementView() throws {
            let app = XCUIApplication()
            app.launch()

            // Navigate to the ManagementView
            let tabBar = app.tabBars["Tab Bar"]
            tabBar.buttons["Management"].tap()

            // Check if the "DiabetiCare" navigation title exists
            XCTAssertTrue(app.navigationBars["DiabetiCare"].exists)

            // Test the User Profile button
            let userProfileButton = app.buttons["User Profile"]
            XCTAssertTrue(userProfileButton.exists)
            
     
        }
    
    func testMealsView() throws {
            let app = XCUIApplication()
            app.launch()
        
            // Navigate to the ManagementView
            let tabBar = app.tabBars["Tab Bar"]
            tabBar.buttons["Meals"].tap()

            // Test if the "Food Logger" navigation title exists
            XCTAssertTrue(app.navigationBars["Food Logger"].exists)
            
            // Test if the add food button exists
            let addButton = app.buttons["Add food"]
            XCTAssertTrue(addButton.exists)
            

        }
}

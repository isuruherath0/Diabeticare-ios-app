//
//  IT21041648Tests.swift
//  IT21041648Tests
//
//  Created by Isuru Herath on 2024-06-07.
//

import XCTest
import SwiftUI
import CoreData
@testable import IT21041648

final class IT21041648Tests: XCTestCase {

    var dataController: TestDataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        // Initialize the Test Data Controller
        dataController = TestDataController()
        managedObjectContext = dataController.container.viewContext
    }

    override func tearDownWithError() throws {
        // Clean up
        dataController = nil
        managedObjectContext = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddFood() throws {
        let initialCount = try managedObjectContext.count(for: Food.fetchRequest())
        
        dataController.addFood(name: "Test Food", calories: 100, context: managedObjectContext)
        
        let finalCount = try managedObjectContext.count(for: Food.fetchRequest())
        XCTAssertEqual(finalCount, initialCount + 1, "Food item should be added")
    }

    func testEditFood() throws {
        let food = Food(context: managedObjectContext)
        food.id = UUID()
        food.name = "Old Name"
        food.calories = 100

        dataController.editFood(food: food, name: "New Name", calories: 200, context: managedObjectContext)
        
        XCTAssertEqual(food.name, "New Name", "Food name should be updated")
        XCTAssertEqual(food.calories, 200, "Food calories should be updated")
    }



    func testMealsView() throws {
        let view = MealsView().environment(\.managedObjectContext, managedObjectContext)
        let viewController = UIHostingController(rootView: view)
        
        XCTAssertNotNil(viewController, "View controller should not be nil")
    }

    func testEditFoodView() throws {
        let food = Food(context: managedObjectContext)
        food.id = UUID()
        food.name = "Test Food"
        food.calories = 100

        let view = EditFoodView(food: food).environment(\.managedObjectContext, managedObjectContext)
        let viewController = UIHostingController(rootView: view)
        
        XCTAssertNotNil(viewController, "View controller should not be nil")
    }

    func testManagementView() throws {
        let profileData = ProfileData()
        let view = ManagementView().environmentObject(profileData)
        let viewController = UIHostingController(rootView: view)
        
        XCTAssertNotNil(viewController, "View controller should not be nil")
    }
}

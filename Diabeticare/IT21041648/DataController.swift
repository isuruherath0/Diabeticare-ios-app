//
//  DataController.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name : "IT21041648")
    
    init() {
        container.loadPersistentStores{ desc , error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context : NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("error in saving data")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
            let food = Food(context: context)
            food.id = UUID()
            food.date = Date()
            food.name = name
            food.calories = calories
            
            save(context: context)
        }
        
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
            food.date = Date()
            food.name = name
            food.calories = calories
            
            save(context: context)
        }
}

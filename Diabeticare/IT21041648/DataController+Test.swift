//
//  DataController+Test.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-09.
//

import Foundation
import CoreData

class TestDataController: DataController {
    override init() {
        super.init()
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
}


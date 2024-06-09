//
//  HealthManager.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    @Published var stepCount: Double = 0.0
    
    init() {
        let steps = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let healthTypes: Set = [steps]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                await fetchStepCount()
            } catch {
                print("error fetching health data")
            }
        }
    }
    
    func fetchStepCount() async {
        let stepsType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                print("Failed to fetch steps = \(error?.localizedDescription ?? "N/A")")
                return
            }
            
            DispatchQueue.main.async {
                self.stepCount = sum.doubleValue(for: HKUnit.count())
            }
        }
        healthStore.execute(query)
    }
}


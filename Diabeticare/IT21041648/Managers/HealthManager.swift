//
//  HealthManager.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import Foundation
import HealthKit

class HealthManager : ObservableObject {
    
    init(){
        
        let steps = HKQuantityType(.stepCount)
        
        let healthtypes = [steps]
        
        Task{
            do {
                try await HKHealthStore.requestAuthorization(toShare: [] , read: healthtypes)
            }catch{
                print("error fetching health data")
            }
        }
    }
}

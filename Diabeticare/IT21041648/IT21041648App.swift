//
//  IT21041648App.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import SwiftUI

@main
struct IT21041648App: App {
    @StateObject private var profileData = ProfileData()
    @StateObject private var dataController = DataController()
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileData)
                .environment(modelData)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

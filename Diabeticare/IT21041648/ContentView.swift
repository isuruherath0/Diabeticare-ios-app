//
//  ContentView.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//
import SwiftUI

struct ContentView: View {
    
    @State private var selection : Tab = .management
    @StateObject private var profileData = ProfileData()
    
    enum Tab {
        
        case management
        case prediction
        case meals
    }
    

    
    var body: some View {
        
//        ManagementView()
        TabView(selection : $selection ) {
            ManagementView()                .environmentObject(profileData)
                .tabItem{
                    Label("Management" , systemImage: "heart.text.square")
                }
                .tag(Tab.management)
            MapView()
                .tabItem{
                Label("Map" , systemImage: "mappin.and.ellipse.circle.fill")
            }
                .tag(Tab.prediction)
            MealsView()
                .tabItem{
                Label("Meals" , systemImage: "list.bullet")
            }
                .tag(Tab.meals)
        }
    }
    
}


#Preview {
    ContentView()
}

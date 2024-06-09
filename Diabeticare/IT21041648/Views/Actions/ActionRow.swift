//
//  ActionRow.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import SwiftUI

struct ActionRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Actions")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    
                    NavigationLink {MealsView()}
                        label: {ActionItemMealLog()}

                    NavigationLink {MapView()} 
                        label: {ActionItemMap()}
                    NavigationLink{ LandmarkList()} label: {
                        ActionItemMeals()}
                    NavigationLink{PredictView()}
                        label: {ActionItemPredict()}
                        
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    ActionRow()
}

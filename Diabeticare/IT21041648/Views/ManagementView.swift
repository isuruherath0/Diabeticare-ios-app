//
//  ManagementView.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import SwiftUI

import SwiftUI

struct ManagementView: View {
    @StateObject private var healthManager = HealthManager()
    @State private var showingProfile = false
    @EnvironmentObject var profileData: ProfileData

    var body: some View {
        NavigationView {
            List {
                Image("cover").resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                VStack {
                    Spacer()
                    Text("Daily Summary")
                        .font(.headline)

                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                        StepCard(Steps: Int(healthManager.stepCount))
                        BloodGlucoseCard(Glucose: Int( profileData.profile.bloodSugar))
                    }

                    Spacer()
                    ActionRow()
                    Spacer()
                }
            }
            .navigationTitle("DiabetiCare")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(profileData)
            }
        }
    }
}

#Preview {
    ManagementView().environmentObject(ProfileData())
}

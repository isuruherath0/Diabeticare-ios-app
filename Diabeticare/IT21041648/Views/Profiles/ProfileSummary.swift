//
//  ProfileSummary.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        ScrollView {
            Spacer()
            Spacer()
            CircleImage(image: Image("profile2"))
            VStack(alignment: .leading, spacing: 10) {
                
 
                
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Active Mode: \(profile.seasonalPhoto.rawValue)")
                
                Text("Gender: \(profile.gender.rawValue)")
                Text("Blood Sugar : \(String(profile.bloodSugar)) mg/dl")
                Text("Last Checkup: ") + Text(profile.goalDate, style: .date)


                Divider()


            }
            .padding()
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}

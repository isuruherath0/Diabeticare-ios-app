import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Text("Blood Sugar")
                Spacer()
                TextField("Blood Sugar", value: $profile.bloodSugar, formatter: NumberFormatter())
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }

            Picker("Gender", selection: $profile.gender) {
                ForEach(Profile.Gender.allCases) { gender in
                    Text(gender.rawValue).tag(gender)
                }
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }

            Picker("Active Type", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }

            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Last Checkup")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}

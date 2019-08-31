//
//  PersonalProfile.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI

struct PersonalProfile: View {
    @Binding var weight: Int
    @Binding var height: Int
    @Binding var birthDate: Date
    @Binding var gender: Gender

    var dateRange: ClosedRange<Date> {
        let now = Date()
        let min = Calendar.current.date(byAdding: .year, value: -maximumAge, to: now)!
        return min...now
    }

    var body: some View {
        Section(header: Text("Your Profile".uppercased())) {
            Picker(
                selection: $gender,
                label: Text("Gender"),
                content: {
                    ForEach(Gender.allCases) { gender in
                        Text(gender.name).tag(gender)
                    }
                }
            )

            DatePicker(
                selection: $birthDate,
                in: dateRange,
                displayedComponents: .date,
                label: { Text("Date of Birth") }
            )

            Picker(
                selection: $height,
                label: Text("Height (cm)"),
                content: {
                    ForEach(100...260, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                }
            )

            Picker(
                selection: $weight,
                label: Text("Weight (kg)"),
                content: {
                    ForEach(30...220, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                }
            )

//            HStack {
//                Text("Height (cm)")
//                Spacer()
//                NavigationLink(destination: Height(height: $height)) {
//                    Text("\(height)")
//                }
//            }
        }
    }
}

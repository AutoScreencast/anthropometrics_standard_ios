//
//  YourProfile.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI

struct YourProfile: View {
    @State private var gender = Gender.male
    @State private var birthDate = Date()
    @State private var height = 160
    @State private var weight = 70
    @State private var fat = 0
    @State private var activityLevel = ActivityLevel.sedentary

    var body: some View {
        NavigationView {
            Form {
                PersonalProfile(
                    weight: $weight,
                    height: $height,
                    birthDate: $birthDate,
                    gender: $gender
                )

                Section(header: Text("Optional Data".uppercased())) {
                    Picker(
                        selection: $fat,
                        label: Text("Body fat (%)"),
                        content: {
                            ForEach(0...100, id: \.self) {
                                Text("\($0)").tag($0)
                            }
                        }
                    )
                }

                Section(header: Text("Activity Level".uppercased())) {
                    Picker(
                        selection: $activityLevel,
                        label: Text("Activity Factor"),
                        content: {
                            ForEach(ActivityLevel.allCases) { al in
                                Text(al.name).tag(al)
                            }
                        }
                    )
                }

                RestingEnergyExpenditure(
                    mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                    cunningham: cunningham(fat: fat, weight: weight),
                    fat: fat
                )

                ActiveEnergyExpenditure(
                    mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                    cunningham: cunningham(fat: fat, weight: weight),
                    fat: fat,
                    activityLevel: activityLevel
                )

                TotalDailyEnergyExpenditure(
                    mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                    katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                    cunningham: cunningham(fat: fat, weight: weight),
                    fat: fat,
                    activityLevel: activityLevel
                )

            }
            .navigationBarTitle(Text("Anthropometrics"))
        }
    }
}

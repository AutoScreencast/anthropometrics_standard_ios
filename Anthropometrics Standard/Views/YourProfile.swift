//
//  YourProfile.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI

struct YourProfile: View {
    @Binding var gender: Gender
    @Binding var birthDate: Date
    @Binding var height: Int
    @Binding var weight: Int
    @Binding var fat: Int
    @Binding var activityLevel: ActivityLevel

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

            }
            .navigationBarTitle(Text("Profile"))
        }
    }
}

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

                Section(header: Text(K.Section.BodyFat.SectionHeader.uppercased())) {
                    Picker(
                        selection: $fat,
                        label: Text(K.Section.BodyFat.Label),
                        content: {
                            ForEach(0...100, id: \.self) {
                                Text("\($0)").tag($0)
                            }
                        }
                    )
                }

                Section(header: Text(K.Section.ActivityLevel.SectionHeader.uppercased())) {
                    Picker(
                        selection: $activityLevel,
                        label: Text(K.Section.ActivityLevel.Label),
                        content: {
                            ForEach(ActivityLevel.allCases) { al in
                                Text(al.name).tag(al)
                            }
                        }
                    )
                }

            }
            .navigationBarTitle(Text(K.Tabs.Profile.Title))
        }
    }
}

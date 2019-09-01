//
//  TabContainer.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/09/01.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


struct TabContainer: View {

    @Binding var gender: Gender
    @Binding var birthDate: Date
    @Binding var height: Int
    @Binding var weight: Int
    @Binding var fat: Int
    @Binding var activityLevel: ActivityLevel

    var body: some View {
        TabView {
            YourProfile(
                gender: $gender,
                birthDate: $birthDate,
                height: $height,
                weight: $weight,
                fat: $fat,
                activityLevel: $activityLevel
            )
                .tabItem {
                    Image(systemName: K.Tabs.Profile.Icon)
                    Text(K.Tabs.Profile.Title)
                }

            RestingEnergyExpenditure(
                mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                cunningham: cunningham(fat: fat, weight: weight),
                fat: fat
            )
                .tabItem {
                    Image(systemName: K.Tabs.Resting.Icon)
                    Text(K.Tabs.Resting.Title)
                }

            ActiveEnergyExpenditure(
                mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                cunningham: cunningham(fat: fat, weight: weight),
                fat: fat,
                activityLevel: activityLevel
            )
                .tabItem {
                    Image(systemName: K.Tabs.Active.Icon)
                    Text(K.Tabs.Active.Title)
                }

            TotalDailyEnergyExpenditure(
                mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                cunningham: cunningham(fat: fat, weight: weight),
                fat: fat,
                activityLevel: activityLevel
            )
                .tabItem {
                    Image(systemName: K.Tabs.Total.Icon)
                    Text(K.Tabs.Total.Title)
                }

        }.font(.headline)
    }
}

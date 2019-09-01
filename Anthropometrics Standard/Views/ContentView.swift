//
//  ContentView.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


let maximumAge = 150

//struct Height: View {
//    @Binding var height: Double
//
//    var doubleFormatter: NumberFormatter {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 1
//        formatter.generatesDecimalNumbers = true
//        return formatter
//    }
//
//    var body: some View {
//        Form {
//            Section {
//                TextField(
//                    "Height (cm)",
//                    value: $height,
//                    formatter: doubleFormatter,
//                    onEditingChanged: { edit in
//                        print("edit: \(edit)")
//                    }
//                ).keyboardType(.decimalPad)
//            }
//        }
//    }
//}

//struct RestingEnergy: View {
//    var body: some View {
//        NavigationView {
//            Text("Resting Energy")
//            .navigationBarTitle(Text("Resting Energy"))
//        }
//    }
//}

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
                    Image(systemName: "person.circle")
                    Text("Profile")
                }

            RestingEnergyExpenditure(
                mifflinStJeor: mifflinStJeor(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                revisedHarrisBenedict: revisedHarrisBenedict(weight: weight, height: height, age: getAge(birthDate: birthDate), gender: gender),
                katchMcArdle: katchMcArdle(fat: fat, weight: weight),
                cunningham: cunningham(fat: fat, weight: weight),
                fat: fat
            )
                .tabItem {
                    Image(systemName: "bed.double")
                    Text("Resting")
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
                    Image(systemName: "hare")
                    Text("Active")
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
                    Image(systemName: "sum")
                    Text("Total")
                }

        }.font(.headline)
    }
}

struct ContentView: View {
    @State private var gender = Gender.male
    @State private var birthDate = Date()
    @State private var height = 160
    @State private var weight = 70
    @State private var fat = 0
    @State private var activityLevel = ActivityLevel.sedentary

    var body: some View {
        TabContainer(
            gender: $gender,
            birthDate: $birthDate,
            height: $height,
            weight: $weight,
            fat: $fat,
            activityLevel: $activityLevel
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

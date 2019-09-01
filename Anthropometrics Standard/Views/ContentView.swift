//
//  ContentView.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @State private var gender = K.Profile.GenderDefault
    @State private var birthDate = K.Profile.BirthDateDefault
    @State private var height = K.Profile.HeightDefault
    @State private var weight = K.Profile.WeightDefault
    @State private var fat = K.Profile.FatDefault
    @State private var activityLevel = K.Profile.ActivityLevelDefault

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

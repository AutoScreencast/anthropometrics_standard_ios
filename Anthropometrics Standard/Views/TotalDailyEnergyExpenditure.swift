//
//  TotalDailyEnergyExpenditure.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/09/01.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


struct TotalDailyEnergyExpenditure: View {
    var mifflinStJeor: Double
    var revisedHarrisBenedict: Double
    var katchMcArdle: Double
    var cunningham: Double
    var fat: Int
    var activityLevel: ActivityLevel

    func activityMultiplier(activityLevel: ActivityLevel) -> Double {
        var multiple: Double

        switch activityLevel {
        case .sedentary:
            multiple = 1.2
        case .lightlyActive:
            multiple = 1.375
        case .moderatelyActive:
            multiple = 1.55
        case .veryActive:
            multiple = 1.725
        case .extremelyActive:
            multiple = 1.9
        }

        return multiple
    }

    var body: some View {
        Section(
            header: HStack {
                Text("Total Daily Energy Expenditure (TDEE)".uppercased())
                Spacer()
                Text("kcal/day")
            }
        ) {
            HStack {
                Text("Mifflin-St. Jeor")
                Spacer()
                Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * mifflinStJeor))
            }

            HStack {
                Text("Revised Harris-Benedict")
                Spacer()
                Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * revisedHarrisBenedict))
            }

            if fat != 0 {
                HStack {
                    Text("Katch-McArdle")
                    Spacer()
                    Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * katchMcArdle))
                }
            }

            if fat != 0 {
                HStack {
                    Text("Cunningham")
                    Spacer()
                    Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * cunningham))
                }
            }
        }
    }
}

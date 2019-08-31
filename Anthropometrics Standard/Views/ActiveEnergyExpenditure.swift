//
//  ActiveEnergyExpenditure.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/09/01.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


struct ActiveEnergyExpenditure: View {
    var mifflinStJeor: Double
    var revisedHarrisBenedict: Double
    var katchMcArdle: Double
    var cunningham: Double
    var fat: Int
    var activityLevel: ActivityLevel

    func activityMultiplier(activityLevel: ActivityLevel) -> Double {
        var addedFactor: Double

        switch activityLevel {
        case .sedentary:
            addedFactor = 0.2
        case .lightlyActive:
            addedFactor = 0.375
        case .moderatelyActive:
            addedFactor = 0.55
        case .veryActive:
            addedFactor = 0.725
        case .extremelyActive:
            addedFactor = 0.9
        }

        return addedFactor
    }

    var body: some View {
        Section(
            header: HStack {
                Text("Active Energy Expenditure".uppercased())
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

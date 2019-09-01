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
            multiple = (1 + K.Activity.Sedentary)
        case .lightlyActive:
            multiple = (1 + K.Activity.LightlyActive)
        case .moderatelyActive:
            multiple = (1 + K.Activity.ModeratelyActive)
        case .veryActive:
            multiple = (1 + K.Activity.VeryActive)
        case .extremelyActive:
            multiple = (1 + K.Activity.ExtremelyActive)
        }

        return multiple
    }

    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: HStack {
                        Text(K.Tabs.Total.SectionHeader.uppercased())
                        Spacer()
                        Text(K.Info.CaloriesPerDayUnit)
                    }
                ) {
                    HStack {
                        Text(K.Formula.MifflinStJeor)
                        Spacer()
                        Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * mifflinStJeor))
                    }

                    HStack {
                        Text(K.Formula.RevisedHarrisBenedict)
                        Spacer()
                        Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * revisedHarrisBenedict))
                    }

                    if fat != K.Profile.FatDefault {
                        HStack {
                            Text(K.Formula.KatchMcArdle)
                            Spacer()
                            Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * katchMcArdle))
                        }
                    }

                    if fat != K.Profile.FatDefault {
                        HStack {
                            Text(K.Formula.Cunningham)
                            Spacer()
                            Text(formatDoubleAsString(value: activityMultiplier(activityLevel: activityLevel) * cunningham))
                        }
                    }
                }
                .navigationBarTitle(Text(K.Tabs.Total.Title))
            }
        }
    }
}

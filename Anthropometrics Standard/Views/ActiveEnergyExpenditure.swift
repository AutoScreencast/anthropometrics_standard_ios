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
            addedFactor = K.Activity.Sedentary
        case .lightlyActive:
            addedFactor = K.Activity.LightlyActive
        case .moderatelyActive:
            addedFactor = K.Activity.ModeratelyActive
        case .veryActive:
            addedFactor = K.Activity.VeryActive
        case .extremelyActive:
            addedFactor = K.Activity.ExtremelyActive
        }

        return addedFactor
    }

    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: HStack {
                        Text(K.Tabs.Active.SectionHeader.uppercased())
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
                .navigationBarTitle(Text(K.Tabs.Active.Title))
            }
        }
    }
}

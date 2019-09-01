//
//  RestingEnergyExpenditure.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


struct RestingEnergyExpenditure: View {
    
    var mifflinStJeor: Double
    var revisedHarrisBenedict: Double
    var katchMcArdle: Double
    var cunningham: Double
    var fat: Int

    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: HStack {
                        Text(K.Tabs.Resting.SectionHeader.uppercased())
                        Spacer()
                        Text(K.Info.CaloriesPerDayUnit)
                    }
                ) {
                    HStack {
                        Text(K.Formula.MifflinStJeor)
                        Spacer()
                        Text(formatDoubleAsString(value: mifflinStJeor))
                    }

                    HStack {
                        Text(K.Formula.RevisedHarrisBenedict)
                        Spacer()
                        Text(formatDoubleAsString(value: revisedHarrisBenedict))
                    }

                    if fat != K.Profile.FatDefault {
                        HStack {
                            Text(K.Formula.KatchMcArdle)
                            Spacer()
                            Text(formatDoubleAsString(value: katchMcArdle))
                        }
                    }

                    if fat != K.Profile.FatDefault {
                        HStack {
                            Text(K.Formula.Cunningham)
                            Spacer()
                            Text(formatDoubleAsString(value: cunningham))
                        }
                    }
                }
                .navigationBarTitle(Text(K.Tabs.Resting.Title))
            }
        }
    }
}

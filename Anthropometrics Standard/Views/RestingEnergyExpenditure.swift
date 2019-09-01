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
                        Text("Resting Energy Expenditure".uppercased())
                        Spacer()
                        Text("kcal/day")
                    }
                ) {
                    HStack {
                        Text("Mifflin-St. Jeor")
                        Spacer()
                        Text(formatDoubleAsString(value: mifflinStJeor))
                    }

                    HStack {
                        Text("Revised Harris-Benedict")
                        Spacer()
                        Text(formatDoubleAsString(value: revisedHarrisBenedict))
                    }

                    if fat != 0 {
                        HStack {
                            Text("Katch-McArdle")
                            Spacer()
                            Text(formatDoubleAsString(value: katchMcArdle))
                        }
                    }

                    if fat != 0 {
                        HStack {
                            Text("Cunningham")
                            Spacer()
                            Text(formatDoubleAsString(value: cunningham))
                        }
                    }
                }
                .navigationBarTitle(Text("Resting"))
            }
        }
    }
}

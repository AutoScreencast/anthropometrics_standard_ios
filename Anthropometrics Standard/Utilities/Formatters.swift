//
//  Formatters.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import Foundation


var doubleFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 0
    formatter.generatesDecimalNumbers = true
    return formatter
}

func formatDoubleAsString(value: Double) -> String {
    return doubleFormatter.string(from: NSNumber(value: value)) ?? ""
}

func getAge(birthDate: Date) -> Double {
    let today = Date()
    let intervalInSeconds = today.timeIntervalSince(birthDate)
    let intervalInYears = intervalInSeconds / (60 * 60 * 24 * 365)
    return intervalInYears
}

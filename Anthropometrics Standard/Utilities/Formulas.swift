//
//  Formulas.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import Foundation


func mifflinStJeor(weight: Int, height: Int, age: Double, gender: Gender) -> Double {
    var d: Double
    let a = 9.99 * Double(weight)
    let b = 6.25 * Double(height)
    let c = 4.92 * Double(age)
    if gender == .male {
        d = 5.0
    } else {
        d = -161.0
    }
    return a + b - c + d
}

func revisedHarrisBenedict(weight: Int, height: Int, age: Double, gender: Gender) -> Double {
    var a, b, c, d: Double
    if gender == .male {
        a = 88.4
        b = 13.4 * Double(weight)
        c = 4.8 * Double(height)
        d = 5.68 * Double(age)
    } else {
        a = 447.6
        b = 9.25 * Double(weight)
        c = 3.10 * Double(height)
        d = 4.33 * Double(age)
    }
    return a + b + c - d
}

func katchMcArdle(fat: Int, weight: Int) -> Double {
    let leanBodyMass: Double = Double(weight) * (100 - Double(fat)) / 100
    let a = 370.0
    let b = 21.6 * leanBodyMass
    return a + b
}

func cunningham(fat: Int, weight: Int) -> Double {
    let leanBodyMass: Double = Double(weight) * (100 - Double(fat)) / 100
    let a = 500.0
    let b = 22.0 * leanBodyMass
    return a + b
}

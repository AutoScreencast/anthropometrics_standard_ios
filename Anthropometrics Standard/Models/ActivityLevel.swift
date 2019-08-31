//
//  ActivityLevel.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import Foundation


enum ActivityLevel: CaseIterable, Identifiable {
    case sedentary, lightlyActive, moderatelyActive, veryActive, extremelyActive
    var id: ActivityLevel { self }
    var name: String {
        return "\(self)".map { $0.isUppercase ? " \($0)" : "\($0)" }
            .joined().capitalized
    }
}

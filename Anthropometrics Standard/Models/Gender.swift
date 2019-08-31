//
//  Gender.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import Foundation


enum Gender: CaseIterable, Identifiable {
    case male, female
    var id: Gender { self }
    var name: String { return "\(self)".capitalized }
}

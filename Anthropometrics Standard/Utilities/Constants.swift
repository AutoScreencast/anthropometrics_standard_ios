//
//  Constants.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/09/01.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import Foundation


struct K {

    struct Activity {
        static let Sedentary = 0.2
        static let LightlyActive = 0.35
        static let ModeratelyActive = 0.55
        static let VeryActive = 0.725
        static let ExtremelyActive = 0.9
    }

    struct Profile {
        static let GenderDefault = Gender.male
        static let BirthDateDefault = Date() // Today’s date
        static let HeightDefault = 160 // in cm
        static let WeightDefault = 70 // in kg
        static let FatDefault = 0 // in % terms
        static let ActivityLevelDefault = ActivityLevel.sedentary
        static let MaximumAge = 150 // in years
    }

    struct Formula {
        static let MifflinStJeor = "Mifflin-St. Jeor"
        static let RevisedHarrisBenedict = "Revised Harris-Benedict"
        static let KatchMcArdle = "Katch-McArdle"
        static let Cunningham = "Cunningham"
    }

    struct InputField {
        static let GenderLabel = "Gender"
        static let BirthDateLabel = "Date of Birth"
        static let HeightLabel = "Height (cm)"
        static let WeightLabel = "Weight (kg)"
    }

    struct Info {
        static let CaloriesPerDayUnit = "kcal/day"
    }

    struct Section {
        struct BodyFat {
            static let SectionHeader = "Optional Data"
            static let Label = "Body fat (%)"
        }

        struct ActivityLevel {
            static let SectionHeader = "Activity Level"
            static let Label = "Activity Factor"
        }
    }

    struct Tabs {
        struct Profile {
            static let Icon = "person.circle"
            static let Title = "Profile"
            static let SectionHeader = "Your Data"
        }

        struct Resting {
            static let Icon = "bed.double"
            static let Title = "Resting"
            static let SectionHeader = "Resting Energy Expenditure"
        }

        struct Active {
            static let Icon = "hare"
            static let Title = "Active"
            static let SectionHeader = "Active Energy Expenditure"
        }

        struct Total {
            static let Icon = "sum"
            static let Title = "Total"
            static let SectionHeader = "Total Daily Energy Expenditure (TDEE)"
        }
    }

}

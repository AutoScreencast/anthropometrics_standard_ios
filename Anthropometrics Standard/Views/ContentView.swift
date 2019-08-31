//
//  ContentView.swift
//  Anthropometrics Standard
//
//  Created by BowdenTom on 2019/08/31.
//  Copyright © 2019 Mirai LLP. All rights reserved.
//

import SwiftUI


let maximumAge = 150

//struct Height: View {
//    @Binding var height: Double
//
//    var doubleFormatter: NumberFormatter {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 1
//        formatter.generatesDecimalNumbers = true
//        return formatter
//    }
//
//    var body: some View {
//        Form {
//            Section {
//                TextField(
//                    "Height (cm)",
//                    value: $height,
//                    formatter: doubleFormatter,
//                    onEditingChanged: { edit in
//                        print("edit: \(edit)")
//                    }
//                ).keyboardType(.decimalPad)
//            }
//        }
//    }
//}

//struct RestingEnergy: View {
//    var body: some View {
//        NavigationView {
//            Text("Resting Energy")
//            .navigationBarTitle(Text("Resting Energy"))
//        }
//    }
//}

//struct TabContainer: View {
//    var body: some View {
//        TabView {
//            YourProfile()
//                .tabItem {
//                    Image(systemName: "1.square.fill")
//                    Text("Your Profile")
//                }
//
//            RestingEnergy()
//                .tabItem {
//                    Image(systemName: "2.square.fill")
//                    Text("Resting Energy")
//                }
//        }.font(.headline)
//    }
//}

struct ContentView: View {
    var body: some View {
//        TabContainer()
        YourProfile()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

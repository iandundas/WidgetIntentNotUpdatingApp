//
//  TapTapTestApp.swift
//  TapTapTest
//
//  Created by Ian Dundas on 20/09/2023.
//

import SwiftUI
import RealmSwift

@main
struct TapTapTestApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, .ian)
        }
    }
}



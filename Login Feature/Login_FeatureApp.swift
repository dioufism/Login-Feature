//
//  Login_FeatureApp.swift
//  Login Feature
//
//  Created by ousmane diouf on 2/18/23.
//

import SwiftUI
import Alchemy

@main
struct Login_FeatureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(auth: AuthLayer())
        }
    }
}

//
//  HabitoApp.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

@main
struct HabitoApp: App {
    let initializeDatabase = InitialViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.font, Font.custom("Poppins-Regular", size: 14))
        }
    }
}

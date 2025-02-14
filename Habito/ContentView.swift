//
//  ContentView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var isLoggedIn : Bool = false
    var body: some View {
        if !isLoggedIn {
            //SignInView(isLoggedIn: $isLoggedIn)
            Onboarding1(isLoggedIn: $isLoggedIn)
        } else{
            MainTabView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    ContentView()
}

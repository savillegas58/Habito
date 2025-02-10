//
//  ContentView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn : Bool = false
    var body: some View {
        if !isLoggedIn {
            SignInView(isLoggedIn: $isLoggedIn)
        } else{
            MainTabView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    ContentView()
}

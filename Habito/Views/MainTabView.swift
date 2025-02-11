//
//  TabView.swift
//  Habito
//
//  Created by Saul on 2/7/25.
//

import SwiftUI

struct MainTabView: View {
    @Binding var isLoggedIn : Bool
    var body: some View {
        TabView {
            NavigationView{
                HomePageTabView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView{
                DataAnalysisTabView()
            }
            .tabItem {
                Label("Data Analysis", systemImage: "chart.bar")
            }
            NavigationView{
                ProfileTabView(isLoggedIn: $isLoggedIn)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        MainTabView(isLoggedIn: $isLoggedIn)
    }
}

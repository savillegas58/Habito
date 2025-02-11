//
//  HomePageTabView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct HomePageTabView: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView{
            DailyHabitsTrackerHomeCardView()
                .padding(.bottom, 10)
            DailyHabitsChallengeCardView()
                .padding(.bottom, 10)
            HealthyRecipesCardView()

            
        }.searchable(text: $searchText, prompt: "Search..")
            

        
    }
}

#Preview {
    HomePageTabView()
}

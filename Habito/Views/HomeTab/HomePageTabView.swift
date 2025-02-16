//
//  HomePageTabView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct HomePageTabView: View {
    @State private var searchText: String = ""
    @State private var showSheet: Bool = false
    var body: some View {
        

        VStack{
            HStack{
                Spacer()
                Button(action: {
                    showSheet.toggle()
                }){
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.black)
                }.padding(.trailing, 25)
                    .fullScreenCover(isPresented: $showSheet){
                        NotificationsView(showSheet: $showSheet)
                    }
            }
            ScrollView{
                DailyHabitsTrackerHomeCardView()
                    .padding(.bottom, 10)
                DailyHabitsChallengeHomeCardView()
                    .padding(.bottom, 10)
                HealthyRecipesCardView()

                
            }.searchable(text: $searchText, prompt: "Search..")
        }

            

        
    }
}

#Preview {
    HomePageTabView()
}

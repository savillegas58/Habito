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
                }.accessibilityIdentifier("NotificationButton")
                .padding(.trailing, 25)
                    
                    .fullScreenCover(isPresented: $showSheet){
                        NotificationsView(showSheet: $showSheet)
                            .accessibilityIdentifier("NotificationsView")

                    }
            }
            ScrollView{
                DailyHabitsTrackerHomeCardView()
                    .padding(.bottom, 10)
                DailyHabitsChallengeHomeCardView()
                    .padding(.bottom, 10)
                HealthyRecipesCardView()

                
            }
        }.navigationTitle(Text("Home")).navigationBarTitleDisplayMode(.inline)

            

        
    }
}

#Preview {
    NavigationView{
        HomePageTabView()
    }
   
}

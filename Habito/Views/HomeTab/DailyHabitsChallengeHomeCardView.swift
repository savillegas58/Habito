//
//  DailyChallengeCardView.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct DailyHabitsChallengeHomeCardView: View {
    var title: String?
    var currentDay: Int?
    var totalDays: Int?
    var currentChallenge: String?
    var image: UIImage?
    var body: some View {
        
        VStack{
            NavigationLink(destination: DailyHabitsChallengeView()) {
                HStack{
                    Text("Today's Challenges")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.tint(.customDarkGray)
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
            .zIndex(1)
            ZStack{
                Image(uiImage: image ?? UIImage(named: "habitchallengecardBG.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 140)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                
                VStack{
                    Text("Today's Top Challenge")
                        .foregroundStyle(.grayishWhite)
                        .font(.title2)
                        .shadow(color: .black, radius: 3)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)

                    Text(currentChallenge ?? "Stretch for atleast 5 minutes")
                        .foregroundStyle(.grayishWhite)
                        .shadow(color: .black, radius: 3)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)

                }
            }

            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
        }
        
    }
}

#Preview {
    DailyHabitsChallengeHomeCardView()
}

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
                    Text("30 Days of healthy habits")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.tint(.customDarkGray)
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
            .zIndex(1)
            ZStack{
                Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 140)
                    .cornerRadius(15)
                    .opacity(0.8)
                
                VStack{
                    Text("Today's Challenge")
                        .foregroundStyle(.grayishWhite)
                    Text("Day \(currentDay ?? 0) of \(totalDays ?? 0)")
                        .foregroundStyle(.grayishWhite)
                        .padding(.bottom)
                    Text(currentChallenge ?? "Walk for 20 Minutes")
                        .foregroundStyle(.grayishWhite)
                    Button("Done"){
                        
                    }.buttonStyle(.borderedProminent)
                        .tint(.darkGreen)
                        .cornerRadius(15)
                }
            }

            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
        }
        
    }
}

#Preview {
    DailyHabitsChallengeHomeCardView()
}

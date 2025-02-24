//
//  DailyHabitsChallengeView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DailyHabitsChallengeView: View {

    var body: some View {
        VStack{
         
            DataPickerView()
                .padding(.top, -200)
            ScrollView{
                
                ChallengeCardView()
                ChallengeCardView(nameOfChallenge: "Run Challenge", challengeDetails: "Run for 30 minutes",image: UIImage(named: "habitBG2.jpg")!)
                ChallengeCardView(nameOfChallenge: "Squat Challenge", challengeDetails: "Squat 10 times",image: UIImage(named: "habitBG3.jpg"))
                ChallengeCardView(nameOfChallenge: "Walk Challenge", challengeDetails: "Walk for 45 minutes",image: UIImage(named: "habitBG4.jpg"))
                ChallengeCardView(nameOfChallenge: "Water Challenge", challengeDetails: "Drink 40 gallons of water in one day",image: UIImage(named: "habitBG1.jpg"))
                ChallengeCardView(nameOfChallenge: "No Sugar Challenge", challengeDetails: "Avoid eating sugary snacks",image: UIImage(named: "habitBG2.jpg"))
            }
        }


    }
}

#Preview {
    DailyHabitsChallengeView()
}

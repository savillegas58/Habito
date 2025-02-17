//
//  DailyHabitsChallengeView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DailyHabitsChallengeView: View {

    var body: some View {
        ScrollView{
            ChallengeCardView()
            ChallengeCardView(dayMessage: 2, nameOfChallenge: "Run Challenge", challengeDetails: "Run for 30 minutes",image: UIImage(named: "habitBG2.jpg")!)
            ChallengeCardView(dayMessage: 3, nameOfChallenge: "Squat Challenge", challengeDetails: "Squat 10 times",image: UIImage(named: "habitBG3.jpg"))
            ChallengeCardView(dayMessage: 4, nameOfChallenge: "Walk Challenge", challengeDetails: "Walk for 45 minutes",image: UIImage(named: "habitBG4.jpg"))
            ChallengeCardView(dayMessage: 5, nameOfChallenge: "Water Challenge", challengeDetails: "Drink 40 gallons of water in one day",image: UIImage(named: "habitBG1.jpg"))
            ChallengeCardView(dayMessage: 6, nameOfChallenge: "No Sugar Challenge", challengeDetails: "Avoid eating sugary snacks",image: UIImage(named: "habitBG2.jpg"))
        }

    }
}

#Preview {
    DailyHabitsChallengeView()
}

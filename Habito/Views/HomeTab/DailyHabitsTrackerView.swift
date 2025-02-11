//
//  DailyHabitsTrackerView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DailyHabitsTrackerView: View {
    var body: some View {

        VStack{
            HabitCard()
                .padding(.bottom, 20)
            HabitCard(message: "Example Message",subMessage: "5/8 Glass" ,percentageProgress: 30, image: UIImage(systemName: ""))
                .padding(.bottom, 20)
            HabitCard()
                .padding(.bottom, 20)
            HabitCard()
        }
    }
}

#Preview {
    DailyHabitsTrackerView()
}

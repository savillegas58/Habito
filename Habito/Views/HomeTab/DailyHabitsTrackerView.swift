//
//  DailyHabitsTrackerView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DailyHabitsTrackerView: View {
    let habitsList = HabitViewModel.habitFetcher.getCurrentAccountHabits()
    
    var body: some View {

        VStack{
            ForEach(habitsList) { habit in
                HabitCard(message: habit.name, subMessage: "\(habit.currentProgress!)/\(habit.goal!)", percentageProgress: calculatePercentageProgress(currentProgress: habit.currentProgress!, goal: habit.goal!), image: UIImage(systemName: ""), currentProgress: habit.currentProgress, goal: habit.goal)
                    .padding(.bottom, 20)
            }

        }
    }
}

//TODO:
private func calculatePercentageProgress(currentProgress: Int, goal: Int) -> Double {
    let percentage = Double(currentProgress)/Double(goal)
    return percentage
}

#Preview {
    //previews dopn't seem to like anything that access the data base and I dont know if that something we cando anything about
    DailyHabitsTrackerView()
}

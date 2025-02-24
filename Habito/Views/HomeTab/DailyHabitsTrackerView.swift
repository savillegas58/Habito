//
//  DailyHabitsTrackerView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DailyHabitsTrackerView: View {
    @State var habitsList = HabitViewModel.habitFetcher.getCurrentAccountHabits()
    
    var body: some View {

        VStack{
            DataPickerView()
                .padding(.top, -300)
            ForEach(habitsList) { habit in
                HabitCard(message: habit.name, subMessage: "\(habit.currentProgress!)/\(habit.goal!)", percentageProgress: calculatePercentageProgress(currentProgress: habit.currentProgress!, goal: habit.goal!), image: UIImage(named: "\(habit.type?.rawValue ?? "running").jpg"),personImage: UIImage(named: "\(habit.type?.rawValue ?? "running")_card.png"),currentProgress: habit.currentProgress, goal: habit.goal)
                    .padding(.top, 20)
            }//.padding(.top, 20)

        }.onAppear(perform: {
            habitsList = HabitViewModel.habitFetcher.getCurrentAccountHabits()
        })
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

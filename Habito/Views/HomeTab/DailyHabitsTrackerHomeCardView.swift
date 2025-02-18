//
//  DailyHabitsTrackerCard.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct DailyHabitsTrackerHomeCardView: View {
    //right now this just grabs the first habit and displays that data
    let habit = HabitViewModel.habitFetcher.getAnySingleHabit()
    let percentage = HabitViewModel.habitFetcher.progressPercentage
    var image: UIImage?
    var percentageValue: Int?
    var body: some View {
        
        VStack{
            NavigationLink(destination: DailyHabitsTrackerView()) {
                HStack{
                    Text("Stay on top of your goals by completing your daily habits")
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
                Image(uiImage: image ?? UIImage(named: "habitshomecard.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 140)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                
                HStack{
                    Gauge(value: Double(percentage), in: 0...100) {
                        Text("\(percentage)%")
                            .shadow(color: .black, radius: 3)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                    }.gaugeStyle(.accessoryCircularCapacity)
                        .tint(.darkGreen)
                        .shadow(color: .black, radius: 0.1)
                        .foregroundStyle(.grayishWhite)
                    VStack{
                        Text(habit.name ?? "habit")
                            .foregroundStyle(.grayishWhite)
                            .font(.headline)
                            .shadow(color: .black, radius: 3)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Text("Stay hydrated for a healthier day")
                            .foregroundStyle(.grayishWhite)
                            .font(.subheadline)
                            .shadow(color: .black, radius: 3)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                    }
                        
                }.padding(.horizontal, 40)

                
            }.clipShape(RoundedRectangle(cornerRadius: 15))
        }


        
    }
}

#Preview {
    DailyHabitsTrackerHomeCardView()
}

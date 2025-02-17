//
//  DailyHabitsTrackerCard.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct DailyHabitsTrackerHomeCardView: View {
    var image: UIImage?
    var percentageValue: Int?
    var body: some View {
        
        VStack{
            NavigationLink(destination: DailyHabitsTrackerView()) {
                HStack{
                    Text("Stay on top of your goals by completing your daily habits")
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
                    
                    Gauge(value: Double((percentageValue ?? 33))/100.0, in: 0...1) {
                        Text("\(percentageValue ?? 33)%")
                    }.gaugeStyle(.accessoryCircularCapacity)
                        .tint(.darkGreen)
                        .foregroundStyle(.grayishWhite)
                    VStack{
                        Text("DRINK 8 GLASSES OF WATER")
                            .foregroundStyle(.grayishWhite)
                            .font(.headline)
                        Text("Stay hydrated for a healthier day")
                            .foregroundStyle(.grayishWhite)
                            .font(.subheadline)
                    }
                        
                }.padding(.horizontal, 40)

                
            }.clipShape(RoundedRectangle(cornerRadius: 15))
        }


        
    }
}

#Preview {
    DailyHabitsTrackerHomeCardView()
}

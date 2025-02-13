//
//  DataAnalysisBarChartCard.swift
//  Habito
//
//  Created by squiggly on 2/12/25.
//

import SwiftUI
import Charts

struct DataAnalysisBarChartCard: View {
    var habitTime: Int?
    var data = [
        HabitDataPoint(hours: 3, day: "Sun"),
        HabitDataPoint(hours: 4, day: "Mon"),
        HabitDataPoint(hours: 1, day: "Tue"),
        HabitDataPoint(hours: 0, day: "Wed"),
        HabitDataPoint(hours: 8, day: "Thu"),
        HabitDataPoint(hours: 2, day: "Fri"),
        HabitDataPoint(hours: 6, day: "Sat")
    ]
    var body: some View {
    
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.grayishWhite)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .overlay(
                    
                    Chart{
                        ForEach(data) { dataPoint in
                            BarMark(x: .value("Day", dataPoint.day), y: .value("Hours", dataPoint.hours))
                                .cornerRadius(15)
                                .annotation(position: .top, content: { Text("\(dataPoint.hours) hr") })
                        }
                    }.foregroundColor(.darkGreen)
                        .padding(.horizontal, 30)
                        .padding(.top,10)
                        .chartXAxis {
                            AxisMarks(values: .automatic) {
                                AxisValueLabel()
                                    .foregroundStyle(.darkGreen)
                    
                            }
                        }
                )
            
        }
        
        
    }
}

#Preview {
    DataAnalysisBarChartCard()
}

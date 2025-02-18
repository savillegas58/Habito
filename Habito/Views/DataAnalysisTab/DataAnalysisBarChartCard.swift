//
//  DataAnalysisBarChartCard.swift
//  Habito
//
//  Created by Saul on 2/12/25.
//

import SwiftUI
import Charts

struct DataAnalysisBarChartCard: View {
    var habitTime: Int?
    let analyzer = DataAnalyzer()
    @State var data = [
        HabitDataPoint(hours: 0, day: "Sun"),
        HabitDataPoint(hours: 0, day: "Mon"),
        HabitDataPoint(hours: 0, day: "Tue"),
        HabitDataPoint(hours: 0, day: "Wed"),
        HabitDataPoint(hours: 0, day: "Thu"),
        HabitDataPoint(hours: 0, day: "Fri"),
        HabitDataPoint(hours: 0, day: "Sat")
    ]
    var body: some View {
    
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.grayishWhite)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .shadow(radius: 3)
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
            
        }.onAppear(perform: {
            data = analyzer.generateBarDailyGraphData()
        })
        
        
    }
}

#Preview {
    DataAnalysisBarChartCard()
}

//
//  DataProgressCard.swift
//  Habito
//
//  Created by Saul on 2/12/25.
//

import SwiftUI

struct DataProgressCard: View {
    var dataAnalyzer = DataAnalyzer()
    @State var percentageValue: Int?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.grayishWhite)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            
            VStack{
                
                HStack{
                    Text("Todays Progress!🔥")
                        .font(.title)
                        .padding(.leading, 40)
                    Spacer()
                    
                    Gauge(value: Double((dataAnalyzer.calculateDailyCompletion()/*percentageValue ?? 33*/))/100.0, in: 0...1) {
                        Text("\(dataAnalyzer.calculateDailyCompletion() /*?? 33*/)%")
                    }.gaugeStyle(.accessoryCircularCapacity)
                        .tint(.darkGreen)
                        .foregroundStyle(.black)
                        .padding(.trailing, 40)
                }
                
                
            }
            
        }
        
    }
}

#Preview {
    DataProgressCard()
}

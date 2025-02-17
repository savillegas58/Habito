//
//  DataAnalysisTabView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct DataAnalysisTabView: View {
    var percentageValue: Int?
    var dataAnalyzer = DataAnalyzer()
    var body: some View {
        VStack{
            Spacer()
            DataProgressCard()
            HStack{
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.grayishWhite)
                        .frame(height: 140)
                        .frame(maxWidth: 185)
                        .shadow(radius: 3)
                        
                    VStack{
                        
                        HStack{
                            
                            VStack{
                                Text("Sleep")
                                    .font(.title)
                                    .padding(.bottom, 10)
                            }

                            Gauge(value: Double(dataAnalyzer.calcualteSleepPercentage()), in: 0...100) {
                                Text("\(dataAnalyzer.calcualteSleepPercentage())%")
                            }.gaugeStyle(.accessoryCircularCapacity)
                                .tint(.darkGreen)
                                .foregroundStyle(.black)
                                
                            
                        }
                        
                        Text("\(dataAnalyzer.calculateSleep())/8 Hours")
                            .font(.title)
                        
                    }
                }
                .padding(.leading, -45)
                .padding(.trailing, 10)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.grayishWhite)
                        .frame(height: 140) 
                        .frame(maxWidth: 155)
                        .shadow(radius: 3)
                    
                    VStack{
                        Image(systemName: "shoeprints.fill")
                            .font(.title)
                        Text("Steps")
                            .font(.title2)
                            .padding(.bottom, 10)
                        Text(String(dataAnalyzer.calculateSteps()))
                            .font(.title2)
                        
                    }
                    
                    
                } .padding(.trailing, -45)
                
                
            }
            DataAnalysisBarChartCard()
            Spacer()
            
            
        }.navigationTitle("Your Progress").navigationBarTitleDisplayMode(.inline)
        
    }
    
    
}

#Preview {
    DataAnalysisTabView()
}

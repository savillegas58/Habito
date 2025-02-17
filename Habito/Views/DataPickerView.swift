//
//  DataPickerView.swift
//  Habito
//
//  Created by Saul on 2/17/25.
//

import SwiftUI

struct DataPickerView: View {
    let currentDate = Date()
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.darkGreen.opacity(0.1))
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .shadow(radius: 3)
            HStack{
                Spacer()
                ForEach(0..<7, id: \.self) { dayOffset in
                    dayButton(day: getDay(for: dayOffset))
                }
                Spacer()
            }.padding(.top,180)
        }
        
    }
    func getDay(for dayOffSet: Int) -> String {
        let calendar = Calendar.current
        let targetDate = calendar.date(byAdding: .day, value: dayOffSet, to: currentDate)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE\nd"
        return dateFormatter.string(from: targetDate)
    }
}



struct dayButton: View{
    var day: String?
    var number: String?
    var isSelected: Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(isSelected ? .darkGreen : .clear)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .shadow(radius: 3)
            VStack{
                Text(day ?? "Sun\n1")
                    .multilineTextAlignment(.center)
            }
        }
            
    }
}

#Preview {
    DataPickerView()
}

//
//  NotificationCard.swift
//  Habito
//
//  Created by squiggly on 2/16/25.
//

import SwiftUI

struct NotificationCard: View {
    var title: String?
    var text: String?
    var image: String?
    var time: String?
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.grayishWhite)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .shadow(radius: 3)
            HStack{
                Image(systemName: image ?? "exclamationmark.circle")
                    .foregroundStyle(.darkGreen)
                    .font(.title)
                    .cornerRadius(10)
                    .padding(.leading, 5)
                    .padding(.bottom, 70)
                
                VStack{
                    Text(title ?? "Welcome to Habit Helper!")
                        .foregroundColor(.black)
                        .frame(width: 280, alignment: .leading)
                        .frame(height: 20)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                        
                    Text(text ?? "Check out the Home tab to get started! Set up a new habit or check out our recipes.")
                        .foregroundColor(.black)
                        .font(.footnote)
                        .frame(maxWidth: 280, alignment: .leading)
                        .frame(height: 58)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                        .lineLimit(3)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundStyle(.gray)
                            .cornerRadius(10)
                            .font(.caption)
                            
                        Text(time ?? "11:30 AM")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }.padding(.leading, -138)
                }
            }

        }.padding(.top, 20)
    }
}

#Preview {
    NotificationCard()
}

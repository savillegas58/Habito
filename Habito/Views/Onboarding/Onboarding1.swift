//
//  Onboarding1.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding1: View {
    @State var showViewTwo = false
    @State var showViewThree = false
    
    var body: some View {
        if showViewTwo {
            Onboarding2()
        } else if showViewThree  {
            Onboarding3()
        } else {
            VStack{
                HStack{
                    Spacer()
                    Button("Skip", action: {
                        showViewThree = true
                    }).padding()
                        .foregroundStyle(.darkGreen)
                }
                HStack{
                    Text("Start a")
                        .bold()
                    Text("healthy life")
                        .bold()
                        .foregroundStyle(.darkGreen)
                    Text("today!")
                        .bold()
                }.padding()
                Text("Track your habits, share your")
                    .bold()
                    .foregroundStyle(.gray)
                Text("accomplishemnts, and get support")
                    .bold()
                    .foregroundStyle(.gray)
                Text("from your community.")
                    .bold()
                    .foregroundStyle(.gray)
            }
            //once there's an image this will hopefully fix the spacing
            Spacer()
            HStack{
                Spacer()
                ArrowButton(showViewTwo: $showViewTwo)
            }
        }
    }
}

struct ArrowButton: View {
    @Binding var showViewTwo : Bool
    var body : some View {
        Button(action: {
            print("Arrow button pushed")
            showViewTwo = true
        }) {
            Image(systemName: "arrow.right")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.grayishWhite)
                .frame(width: 30, height: 70)
                .padding()
        }.background(
            Circle()
                .fill(.customDarkGray)
                .frame(width: 70, height: 70)
        ).padding()
    }
}
#Preview {
    Onboarding1()
}

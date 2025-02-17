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
    @Binding var isLoggedIn : Bool
    
    var body: some View {
        if showViewTwo {
            Onboarding2(isLoggedIn: $isLoggedIn)
        } else if showViewThree  {
            Onboarding3(isLoggedIn: $isLoggedIn)
        } else {
            VStack{
                HStack{
                    Spacer()
                    Button("Skip", action: {
                        showViewThree = true
                    }).padding()
                        .foregroundStyle(.darkGreen)
                }
                Image(uiImage: UIImage(named: "sanjose.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                
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
                Spacer()
                HStack{
                    Spacer()
                    ArrowButton(showViewTwo: $showViewTwo)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            /*Spacer()
            HStack{
                Spacer()
                ArrowButton(showViewTwo: $showViewTwo)
            }*/
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

//creates multiple previews for some reason
struct Onboarding1_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        Onboarding1(isLoggedIn: $isLoggedIn)
    }
}

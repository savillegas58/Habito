//
//  Onboarding2.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding2: View {
    @State var showViewThree = false
    
    @Binding var isLoggedIn : Bool
    var body: some View {
        if showViewThree {
            Onboarding3(isLoggedIn: $isLoggedIn)
        } else {
            VStack{
                Image(uiImage: UIImage(named: "girl_stretching_onboarding1.png")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                Spacer()
                HStack{
                    Text("Achieve")
                        .bold()
                    Text("your goals")
                        .bold()
                        .foregroundStyle(.darkGreen)
                    Text("easily!")
                        .bold()
                }.padding()
                Text("\"We give you simple tools to track your")
                    .bold()
                    .foregroundStyle(.gray)
                Text("habits and analyze you health")
                    .bold()
                    .foregroundStyle(.gray)
                Text("progress\"")
                    .foregroundStyle(.gray)
                    .bold()
                Spacer()
                HStack{
                    Spacer()
                    ArrowButton2(showViewThree: $showViewThree)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
        }
    }
}

//this redclartion iss pretty lazy of me but if i have time I'll refactor
struct ArrowButton2: View {
    @Binding var showViewThree : Bool
    var body : some View {
        Button(action: {
            print("Arrow button pushed")
            showViewThree = true
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


struct Onboarding2_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        Onboarding2(isLoggedIn: $isLoggedIn)
    }
}

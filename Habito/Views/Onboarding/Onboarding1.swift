//
//  Onboarding1.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        VStack{
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
    }
}

#Preview {
    Onboarding1()
}

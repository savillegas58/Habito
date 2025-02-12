//
//  Onboarding2.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        VStack{
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
        }
    }
}

#Preview {
    Onboarding2()
}

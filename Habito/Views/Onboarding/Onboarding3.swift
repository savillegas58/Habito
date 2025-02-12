//
//  Onboarding3.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
        VStack{
            HStack {
                Text("Welcome to")
                    .font(.title)
                Text("Habito")
                    .font(.title)
                    .foregroundStyle(.darkGreen)
            }.padding()
            Text("Build healthy habits, track your")
                .bold()
                .foregroundStyle(.gray)
            Text("progress, and stay motivated every day.")
                .bold()
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    Onboarding3()
}

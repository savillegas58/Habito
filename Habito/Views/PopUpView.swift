//
//  PopUpView.swift
//  Habito
//
//  Created by Saul on 2/17/25.
//

import SwiftUI

struct PopUpView: View {
    @Binding var showPopUpView: Bool
    var body: some View {
        VStack{
            Spacer()
            Image(uiImage: UIImage(named: "checkmark.png")!)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(15)
                .shadow(radius: 3)
            Text("You're amazing!")
                .multilineTextAlignment(.center)
                .font(.title)
                .foregroundColor(.darkGreen)
            Spacer()
            Text("Another habit checked off! Keep going to keep up the momentum!")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .font(.footnote)
            Button {
                showPopUpView.toggle()
            } label: {
                Text("Done")
                    .font(.title2)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.grayishWhite)
                    .background(.darkGreen)
                    .cornerRadius(15)
                    .padding(20)
                    
            }.shadow(radius: 3)

            Spacer()
                
        }.frame(width: 300, height: 400)
            .background(.grayishWhite)
            .cornerRadius(15)
            
    }
}

#Preview {
    @Previewable @State var showPopUpView: Bool = true
    PopUpView(showPopUpView: $showPopUpView)
}

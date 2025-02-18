//
//  HealthyRecipesCardView.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct HealthyRecipesCardView: View {
    var image: UIImage?
    
    var body: some View {
        
        VStack{
            NavigationLink(destination: HealthyRecipesView()) {
                HStack{
                    Text("Try our healthy recipes today")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.tint(.customDarkGray)
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
            .zIndex(1)
            
            ZStack{
                Image(uiImage: image ?? UIImage(named: "eatHealthy.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 140)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                
                HStack{
                    Text("Eat\n It\nHealthy")
                        .foregroundStyle(.grayishWhite)
                        .font(.title)
                        .shadow(color: .black, radius: 3)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .frame(width: 100, height: 110, alignment: .leading)
                    Spacer()
                        
                }.padding(.horizontal, 40)

                
            }

            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
        
       
}

#Preview {
    HealthyRecipesCardView()
}

//
//  RecipeCardView.swift
//  Habito
//
//  Created by Saul on 2/11/25.
//

import SwiftUI

struct RecipeCardView: View {
    var recipeName : String?
    var caloriesInKcal : Int?
    var image : UIImage?
    var body: some View {
        NavigationLink(destination: RecipeView()){
            VStack{
                Image(uiImage: image ?? UIImage(named: "pizza.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 150)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                Text(recipeName ?? "Pizza")
                    .font(.subheadline)
                    .tint(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    
                Text("\(caloriesInKcal ?? 5) kcal")
                    .font(.caption)
                    .tint(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
            }.padding(.bottom , 10)
        }

    }
}

#Preview {
    RecipeCardView()
}

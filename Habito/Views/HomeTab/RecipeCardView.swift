//
//  RecipeCardView.swift
//  Habito
//
//  Created by Saul on 2/11/25.
//

import SwiftUI

struct RecipeCardView: View {
    @State var recipeName : String?
    @State  var ingredients : String?
    @State var instructions : String?
    @State var timeInMinutes : Int?
    @State var caloriesInKcal : Int?
    @State var image : String?
    var body: some View {
        NavigationLink(destination: RecipeView(image: $image, recipeName: $recipeName, ingredients: $ingredients, instructions: $instructions, timeInMinutes: $timeInMinutes, caloriesInKcal: $caloriesInKcal)){
            VStack{
                Image(uiImage: UIImage(named: image ?? "pizza.jpg")!)
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

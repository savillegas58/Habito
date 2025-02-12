//
//  HealthyRecipesView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct HealthyRecipesView: View {
    var body: some View {
        ScrollView{
            Text("Meal Plans")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
            RecipeCardView()
            RecipeCardView()
            RecipeCardView()
        }
    }
}

#Preview {
    HealthyRecipesView()
}

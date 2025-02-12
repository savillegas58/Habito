//
//  RecipeView.swift
//  Habito
//
//  Created by Saul on 2/11/25.
//

import SwiftUI

struct RecipeView: View {
    var image: UIImage?
    var recipeName: String?
    
    var body: some View {
        ZStack(alignment: .top){
            
            Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .opacity(0.8)
                .padding(.top)
            ScrollView{
                
                VStack{

                        Text(recipeName ?? "Pizza")
                        
                        
                        
                        
                    }
                    .padding(.top, 300)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.top, 300)
                    
                
            }
        }


    }
    
    
}

#Preview {
    RecipeView()
}

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
    var ingredients: String?
    var instructions: String?
    var timeInMinutes: Int?
    var calories: Int?
    var body: some View {
        
            ScrollView{
                
                VStack{

                    Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 190)
                        .cornerRadius(15)
                        .opacity(0.8)
                        .padding(.top)
                    
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.darkGreen)
                                .frame(width: 90, height: 60)
                            VStack{
                                Image(systemName: "clock")
                                    .foregroundColor(.grayishWhite)
                                    .font(.title2)
                                Text("\(timeInMinutes ?? 30) m")
                                    .foregroundColor(.grayishWhite)
                                    .font(.headline)
                            }
                            

                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.darkGreen)
                                .frame(width: 90, height: 60)
                            VStack{
                                Image(systemName: "flame")
                                    .foregroundColor(.grayishWhite)
                                    .font(.title2)
                                Text("\(calories ?? 4449) kcl")
                                    .foregroundColor(.grayishWhite)
                                    .font(.headline)
                            }
                            

                        }

                        

                        
                    }.padding()
                    
                    
                    Text(recipeName ?? "Pizza")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.title)
                        .foregroundColor(.darkGreen)
                    Text("Preparation Steps:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    Text("Ingredients:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.title2)
                    Text(ingredients ?? "• 1 cup all-purpose flour\n• 1 teaspoon salt\n• 2 teaspoons (one packet) active dry yeast\n• 1 cup warm water (110°F/45°C)\n• 2 large eggs, room temperature\n• 1 cup vegetable oil\n• 2 teaspoons vanilla extract\n• 1 cup pizza sauce\n• 2 cups shredded mozzarella cheese\n• Your preferred toppings, such as pepperoni")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    Text("Instructions:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.title2)
                    Text(instructions ?? "• Heat the oven to 550°F or higher. Arrange a rack in the lower-middle part of the oven (if you have a baking stone, place it on the rack) and heat the oven to 550°F or higher. Don't be afraid to really crank the heat up to its highest setting, as the high heat will help make a crunchier and more flavorful crust. Let the oven heat for at least 30 minutes.\n•Divide the dough in half. One pound of dough makes 2 (10-inch) pizzas. Divide the dough in half and cover one half with an upside-down bowl or a clean kitchen towel while you prepare the first pizza.\n• Method #1: Pizza Baked on Parchment: Tear off a large piece of parchment paper roughly 12 inches long. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the parchment. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.Method #2: Pizza with Cornmeal or Flour and a Baking Stone: Sprinkle a handful of cornmeal or flour on a pizza peel or on an upside-down rimmed baking sheet. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the peel. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. Shake the peel or baking sheet frequently as you shape to make sure the dough isn't sticking. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.Method #3: Pizza Baked on a Baking Sheet: Brush a thin film of olive oil on a baking sheet. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the baking sheet. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.\n")
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 30)

                       
                    
                    
                }
                    
                
            }
        


    }
    
    
}

#Preview {
    NavigationView{
        RecipeView()
    }
    
}

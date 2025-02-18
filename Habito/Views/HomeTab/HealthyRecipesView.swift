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
            
            
            
            
            
            //Temporary!
            RecipeCardView(recipeName: "Healthy Rice Cooker Garlic Shrimp with Chorizo", ingredients: "2 tablespoons olive oil\n1 tablespoon sherry\n1 teaspoon paprika\n6 cloves garlic, minced, Kosher salt and freshly ground black pepper\n1 pound peeled and deveined jumbo shrimp\n6 ounces fully-cooked chorizo, casings removed, chopped\n1 red bell pepper, finely chopped\n1 small onion, thinly sliced\n2 cups long-grain rice, Pinch crushed red pepper flakes\n1 cup fresh flat-leaf parsley, finely chopped, plus more for serving, Juice of 1/2 lemon, plus slices for serving.", instructions:"Whisk the olive oil, sherry, paprika, garlic, 1/2 teaspoon salt and a few grinds of black pepper in a medium bowl. Fold in the shrimp until combined. Set aside. Add the chorizo to a 6-quart rice cooker, followed by the red pepper and then the onion. Top with the rice, red pepper flakes, 1/2 teaspoon salt and a few grinds of black pepper. Pour in 3 cups of water, then place the shrimp on top, making sure all the garlicky oil from the bowl gets into the cooker. Put the lid on the rice cooker and cook according to the manufacturer's instructions. (Depending on your rice cooker, this should take 30 to 35 minutes. If your rice cooker has not turned off after 30 minutes, remove the shrimp, place the lid back on the rice cooker and continue cooking until the machine indicates the cycle is complete.) Use tongs to remove the shrimp to a plate. Fold the parsley and lemon juice into the rice mixture, making sure to mix up the ingredients from the bottom of the pot, until everything is well combined. Spoon the rice into bowls, top with the shrimp, sprinkle with some parsley and serve with a squeeze of lemon, if desired.", timeInMinutes: 30, caloriesInKcal: 500, image: "rice_garlic_shrimp.jpg")
            
            RecipeCardView(recipeName: "Air Fryer Pomegranate-Glazed Salmon", ingredients:"2 tablespoons pomegranate molasses\n1 1/2 teaspoons sweet chili sauce\n1 1/2 teaspoons low-sodium soy sauce\n1 clove garlic, grated\n2 teaspoons honey\nJuice of 1 lime, Kosher salt and freshly ground black pepper, Four 8-ounce center-cut skinless salmon fillets\n1/2 cup pomegranate arils\n1/4 cup fresh cilantro leaves, finely chopped, 1 tablespoon olive oil, 1 serrano pepper, seeded and finely chopped.", instructions: "Whisk the pomegranate molasses, sweet chili sauce, soy sauce, garlic, 1 teaspoon of the honey, half of the lime juice, 1/4 teaspoon salt and a few grinds of pepper in a medium bowl until combined. Brush the glaze on top of the salmon fillets and season each with 1/4 teaspoon salt and a few grinds of pepper. Arrange the fillets in the basket of a 6-quart air fryer, making sure they are not touching. Cook at 400 degrees F until the tops are dark golden brown in spots and caramelized all over and the salmon easily flakes with a fork when gently pressed, 6 minutes for medium rare and 7 minutes for medium (see Cook's Note). Meanwhile, combine the pomegranate arils, cilantro, olive oil, serrano, remaining 1 teaspoon honey, remaining lime juice, 1/4 teaspoon salt and a few grinds of pepper until well combined. Transfer the salmon to a serving platter and spoon the pomegranate relish over top.", timeInMinutes: 55, caloriesInKcal: 300, image: "pomegranate_salmon.jpg")
            
            RecipeCardView(recipeName: "Healthy Air Fryer Turkey Meatballs with Zoodles", ingredients: "1 1/2 pounds zoodles (spiralized zucchini noodles, from about 3 medium zucchinis; see Cook's Note)\nKosher salt\n1/3 cup plain breadcrumbs\n1/4 cup whole milk\n8 ounces ground turkey\n1/4 cup ricotta\n2 tablespoons chopped fresh parsley\n1 tablespoon finely grated Parmesan, plus more for serving\n1/2 teaspoon dried oregano\nFreshly ground black pepper\n1 1/4 cups jarred tomato sauce", instructions: "Toss the zoodles with a good pinch of salt in a large bowl. Let sit until the zoodles begin to soften and release some excess liquid, about 10 minutes. Pat them dry and set aside. Meanwhile, combine the breadcrumbs and milk in a medium bowl and let sit while the breadcrumbs soften and absorb most of the liquid, about 5 minutes. Add the turkey, ricotta, parsley, Parmesan, oregano, 1/2 teaspoon salt and several grinds of pepper to the breadcrumb mixture, then mix thoroughly with your hands to combine. Form into 12 meatballs (each about 1 1/2 tablespoons and 1 inch wide). Preheat an air fryer to 400 degrees F. Add the meatballs, leaving some space between each for air circulation. Air fry until golden brown on the outside and just cooked through, about 10 minutes, turning the meatballs about halfway through the cooking time.", timeInMinutes: 45, caloriesInKcal: 300, image: "turkey_meatballs.jpg")
        }
    }

}

#Preview {
    NavigationView{
        HealthyRecipesView()
    }
}
    

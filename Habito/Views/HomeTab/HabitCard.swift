//
//  DrinkingCard.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct HabitCard: View {
    var message: String?
    var subMessage: String?
    var percentageProgress: Double?
    var image: UIImage?
    var currentProgress: Int?
    var goal: Int?
    var body: some View {
        NavigationLink(destination: HabitDetailsView(progress: Float(currentProgress!), habitName: message, goal: goal)){
            
                ZStack{
                    
                    Image(uiImage: image ?? UIImage(named: "habitBG1.jpg")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 100)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        .opacity(0.8)

                    
                    HStack{
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.black)
                        
                        VStack{
                            HStack{
                                VStack{
                                    Text(message ?? "Drinking")
                                        .foregroundColor(.black)
                                    Text(subMessage ?? "3/8Glass")
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                Image(systemName: "chevron.right.circle")
                                    .font(.title2)
                                    .foregroundColor(.darkGreen)
          
                                
                            }
                            .padding(.leading, 10)
                            .padding(.trailing, 40)
                            ProgressView(value: Double((percentageProgress ?? 100))/100.0)
                                .scaleEffect(x: 1, y: 2.5)
                                .padding(.leading, 10)
                                .padding(.trailing,50)
                                .tint(.darkGreen)
                        }
                        .padding(.top, 15)

                    }
                    .padding(.leading, 50)


                }
            
        }
  

        
        
        
    }
}

#Preview {
    HabitCard()
}

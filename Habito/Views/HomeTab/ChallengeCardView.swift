//
//  ChallengeCardView.swift
//  Habito
//
//  Created by Saul on 2/12/25.
//

import SwiftUI

struct ChallengeCardView: View {
    var dayMessage: Int?
    var nameOfChallenge: String?
    var challengeDetails: String?
    var image: UIImage?
    var personImage: UIImage?
    var body: some View {
        ZStack{
            Image(uiImage: image ?? UIImage(named: "habitBG1.jpg")!)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 100)
                .cornerRadius(15)
                .shadow(radius: 3)
                .opacity(0.8)
            
            HStack{
                Image(uiImage: personImage ?? UIImage(systemName: "cat.circle")!)
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("Day \(dayMessage ?? 1)")
                                
                            Text(nameOfChallenge ?? "Stretching Challenge")
                                
                            Text(challengeDetails ?? "Stretch for at least 2 seconds")
                                .font(.caption2)

                        }.padding(.trailing, 20)
                        
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .font(.title2)
                            .foregroundColor(.darkGreen)
                            .padding(.leading, 10)
                       
                        
                        
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 40)
                    
                }
                .padding(.top, 10)
                
            }
            .padding(.leading, 50)
        }.padding(.bottom, 20)
    }
}

#Preview {
    ChallengeCardView()
}

//
//  QuickGuideCard.swift
//  Habito
//
//  Created by Saul on 2/16/25.
//

import SwiftUI

struct QuickGuideCard: View {
    var title: String?
    var text: String?
    var image : UIImage?
    var body: some View {
        NavigationLink(destination: QuickGuideCardDetailView(title: title, text: text, image: image)){
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(.grayishWhite)
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .shadow(radius: 3)
                VStack{
                    Spacer()
                    Text(title ?? "Why a Good Night's Sleep is the Foundation of Good Health")
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .frame(height: 60)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                        .lineLimit(2)
                    Text(text ?? "A good night's sleep is often regarded as one of the cornerstones of overall health and well-being. It’s not just about waking up feeling rested,")
                        .foregroundColor(.black)
                        .font(.footnote)
                        .frame(maxWidth: 310, alignment: .leading)
                        .frame(height: 40)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                        .lineLimit(2)
                    Image(uiImage: image ?? UIImage(named: "sleeping1.jpg")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 180)
                        .cornerRadius(15)
                        .shadow(radius: 2)
                        .opacity(0.8)
                        .padding(.top, 5)
                    Spacer()
                }

            }
        }.padding(.top, 20)

    }
}

#Preview {
    QuickGuideCard()
}

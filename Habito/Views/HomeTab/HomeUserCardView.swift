//
//  HomeUserCardView.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct HomeUserCardView: View {
    var image: UIImage?
    var body: some View {
        HStack{
            Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    HomeUserCardView()
}

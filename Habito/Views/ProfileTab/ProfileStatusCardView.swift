//
//  ProfileStatusCardView.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct ProfileStatusCardView: View {
    var message : String?
    var subMessage : String?
    var image: UIImage?
    var body: some View {
        VStack{
            Image(uiImage: image ?? UIImage(systemName: "person.circle")!)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
            Text(message ?? "10hr 20min")
                .font(.headline)
            Text(subMessage ?? "Training time")
                .font(.subheadline)
        } .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 0.5)
                .frame(width: 110, height: 110)
        }
        
        
    }
}

#Preview {
    ProfileStatusCardView()
}

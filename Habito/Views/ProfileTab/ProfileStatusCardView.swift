//
//  ProfileStatusCardView.swift
//  Habito
//
//  Created by squiggly on 2/10/25.
//

import SwiftUI

struct ProfileStatusCardView: View {
    var message : String?
    var subMessage : String?
    var body: some View {
        VStack{
            Text(message ?? "Temp")
                .font(.headline)
            Text(subMessage ?? "Temp2")
                .font(.subheadline)
        } .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 100, height: 100)
        }
        
        
    }
}

#Preview {
    ProfileStatusCardView()
}

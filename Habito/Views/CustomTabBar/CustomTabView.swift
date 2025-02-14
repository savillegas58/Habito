//
//  CustomTabView.swift
//  Habito
//
//  Created by Saul on 2/13/25.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        ZStack{
           
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    .frame(height: 60)
                    .shadow(radius: 2)
                    
            }
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    CustomTabView()
}

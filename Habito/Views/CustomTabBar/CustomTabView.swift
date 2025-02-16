//
//  CustomTabView.swift
//  Habito
//
//  Created by Saul on 2/13/25.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab: Int = 0
    @Binding var isLoggedIn: Bool
    var body: some View {
        ZStack{
           
            VStack {
                Spacer()
                CustomTabBar(isLoggedIn: $isLoggedIn)
                    .frame(height: 60)
                    .shadow(radius: 2)
                    
            }
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

//#Preview {
//    CustomTabView()
//}
struct CustomTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        CustomTabView(isLoggedIn: $isLoggedIn)
    }
}

//
//  CustomTabBar.swift
//  Habito
//
//  Created by squiggly on 2/13/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
     
            CustomTabBarShape()
                .fill(.grayishWhite)
                //.zIndex(1)
            
            Button(action: {
                print("Center button tapped!")
              
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green, in: Circle())
                    .shadow(radius: 5)
                    .padding(.bottom,20)
            }.offset(y: -40)
            
            HStack {
                Spacer()

                
                Button(action: {
                    selectedTab = 0
                }) {
                    Image(systemName: "house")
                        .font(.title)
                        .foregroundColor(selectedTab == 0 ? .darkGreen : .gray)
                        .padding(.bottom,30)
                }
                
                Spacer()

                Spacer()
         
                Button(action: {
                    selectedTab = 2
                }) {
                    Image(systemName: "person")
                        .font(.title)
                        .padding(.bottom,30)
                        .foregroundColor(selectedTab == 2 ? .darkGreen : .gray)
                    
                    
                }

                Spacer()
            }
            .padding(.horizontal, 40)
           
        }
    }
}

#Preview {
    CustomTabView()
}

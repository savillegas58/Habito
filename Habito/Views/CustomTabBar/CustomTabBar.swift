//
//  CustomTabBar.swift
//  Habito
//
//  Created by Saul on 2/13/25.
//

import SwiftUI

struct CustomTabBar: View {
    @State var selectedTab: Int = 0
    @Binding var isLoggedIn : Bool
    @State private var showPlusView = false
    var body: some View {
        VStack{
            ZStack{
                Spacer()
                .fullScreenCover(isPresented: $showPlusView, content:  {
                    CreateNewHabit(showPlusView: $showPlusView)
                })
                
                switch selectedTab {
                case 0 :
                    NavigationView{
                        HomePageTabView()
                            
                    }
                case 1:
                    NavigationView{
                        Text("New View")
                    }
                case 2:
                    NavigationView{
                        DataAnalysisTabView()
                    }
                case 3:
                    NavigationView{
                        ProfileTabView(isLoggedIn: $isLoggedIn)
                    }
                default:
                    NavigationView{
                        HomePageTabView()
                    }
                }
            }
            
            ZStack {
                
                CustomTabBarShape()
                    .fill(.grayishWhite)
                    .shadow(radius: 3)
                    //.zIndex(1)
                
//                NavigationLink(destination: CreateNewHabit()){
//                    Image(systemName: "plus")
//                        .font(.system(size: 50))
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(Color.green, in: Circle())
//                        .shadow(radius: 5)
//                        .padding(.bottom,20)
//
//                }.offset(y: -40)
                Button(action: {
                    withAnimation {
                        showPlusView.toggle()
                    }
                }){
                    Image(systemName: "plus")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green, in: Circle())
                        .shadow(radius: 5)
                        .padding(.bottom,20)
                }.offset(y: -40)

                
                HStack {


                    
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(selectedTab == 0 ? .darkGreen : .gray)
                            .padding(.bottom,30)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                            .foregroundColor(selectedTab == 1 ? .darkGreen : .gray)
                            .padding(.bottom,30)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
             
                    Button(action: {
                        selectedTab = 2
                    }) {
                        Image(systemName: "chart.bar")
                            .font(.title)
                            .padding(.bottom,30)
                            .foregroundColor(selectedTab == 2 ? .darkGreen : .gray)
                        
                    }

                    Spacer()
                    Button(action: {
                        selectedTab = 3
                    }) {
                        Image(systemName: "person")
                            .font(.title)
                            .padding(.bottom,30)
                            .foregroundColor(selectedTab == 3 ? .darkGreen : .gray)
                        
                        
                    }
                }
                .padding(.horizontal, 40)
               
            }.frame(height: 60)
            
            
        }.edgesIgnoringSafeArea(.bottom)
        
        

    }
}

#Preview {
    @Previewable @State var isLoggedIn = true
    @Previewable @State var selectedTab: Int = 0
    NavigationView{
        CustomTabBar(selectedTab: 0, isLoggedIn: $isLoggedIn)
    }
    
}

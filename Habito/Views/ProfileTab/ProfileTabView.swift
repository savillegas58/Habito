//
//  ProfileTabView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct ProfileTabView: View {
    @State var username : String = "SD"
    @Binding var isLoggedIn : Bool
    var body: some View {
        
        
        VStack{
            //ProfileStatusCardView()
            
            List {

                NavigationLink(destination: Text("sadf")){
                    Text("Personal Data")
                        
                        
                }.padding()
                    .foregroundStyle(.black,.black)
                    
                
                NavigationLink(destination: Text("sadf")){
                    Text("Help")
                        
                        
                }.padding()
                    .foregroundStyle(.black,.black)
                    
                .listRowSeparator(.hidden)
                NavigationLink(destination: Text("sadf")){
                    Image(systemName: "trash")
                    Text("Delete Account")
                    
                        
                } .padding()
                    .foregroundStyle(.black,.black)
                    
                
                HStack{
                    Image(systemName: "power")
                        .foregroundColor(.red)
                    Button("Log Out"){
                        isLoggedIn = false
                    }
                    .tint(.red)
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                }
                .listRowSeparator(.hidden)
                .padding()

            
            }.scrollDisabled(true)
            
        }
        
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        ProfileTabView(isLoggedIn: $isLoggedIn)
    }
}

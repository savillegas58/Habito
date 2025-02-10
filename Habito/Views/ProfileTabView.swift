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
        List {
            NavigationLink(destination: Text("sadf")){
                Text("Personal Data")
            }
            
            NavigationLink(destination: Text("sadf")){
                Text("Help")
                    
            }.padding()
            .listRowSeparator(.hidden)
            NavigationLink(destination: Text("sadf")){
                Text("Delete Account")
                    
            } .padding()
            
            HStack{
                Button("Log Out"){
                    isLoggedIn = false
                }
                Spacer()
                Image(systemName: "chevron.right")
                
            }
            .listRowSeparator(.hidden)
            .padding()

                
                
            
        }.scrollDisabled(true)
        
        
        
        
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        ProfileTabView(isLoggedIn: $isLoggedIn)
    }
}

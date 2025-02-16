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
    var image : UIImage?
    var body: some View {
       
        
        VStack{
            //ProfileStatusCardView()
            Spacer()
            Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 120, height: 120)
            
            HStack{
                Spacer()
                ProfileStatusCardView()
                Spacer()
                ProfileStatusCardView()
                Spacer()
                ProfileStatusCardView()
                Spacer()
            }
            .padding(.top, 50)
            
            List {

                NavigationLink(destination: PersonalDataView()){
                    Image(systemName: "person.circle")
                        .font(.title3)
                    Text("Personal Data")
                        
                }.padding()
                    .foregroundStyle(.black,.black)
                    
                
                NavigationLink(destination: Text("sadf")){
                    Image(systemName: "questionmark.circle")
                        .font(.title3)
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
                        .font(.subheadline.bold())
                        
                    
                    
                }
                
                .listRowSeparator(.hidden)
                .padding()
                

            
            }.scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .shadow(radius: 3)
        }.navigationTitle("Your Profile").navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        ProfileTabView(isLoggedIn: $isLoggedIn)
    }
}

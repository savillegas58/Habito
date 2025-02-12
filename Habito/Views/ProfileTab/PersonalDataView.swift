//
//  PersonalDataView.swift
//  Habito
//
//  Created by squiggly on 2/11/25.
//

import SwiftUI

struct PersonalDataView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    @State var image: UIImage?
    var body: some View {
        VStack{
        
            Image(uiImage: image ?? UIImage(named: "sanjose.jpg")!)
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 120, height: 120)
            Text("User name")
            Text("Email")
                .font(.subheadline)
                .padding(.bottom)
            

            Text("Username")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                
            TextField("", text: $username)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.horizontal, 20)

            Text("E-mail")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            TextField("", text: $email)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.horizontal, 20)
                
            Text("Phone Number")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            TextField("", text: $phoneNumber)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.horizontal, 20)
            
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            ZStack{
                if isPasswordVisible {
                    TextField("", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom)
                        .padding(.horizontal, 20)
                } else {
                    SecureField("", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom)
                        .padding(.horizontal, 20)
                }
                    
                HStack{
                    Spacer()
                    Image(systemName: isPasswordVisible ? "eye" :"eye.slash")
                        .font(.title2)
                        .padding(.trailing, 30)
                        .padding(.bottom, 15)
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                }
                

                   
                    
            }.padding(.bottom, 20)

            
            
            
        }.navigationTitle("Personal Data")
    }
}

#Preview {
    PersonalDataView()
}

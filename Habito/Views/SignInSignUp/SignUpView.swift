//
//  SignUpView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            Text("Create Account")
                .padding(.bottom)
            Text("Let's create an account for you!")
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
            SecureField("", text: $password)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.horizontal, 20)
            
            Button("Sign Up"){
                print("You signed up")
                
            }.buttonStyle(.borderedProminent)
                .cornerRadius(15)
                .tint(.darkGreen)
                
                
            
        }.frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 20)
    }
}

#Preview {
    SignUpView()
}

//
//  SignUpView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    var signUpViewModel = SignUpViewModel()
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
                .bold()
                .foregroundStyle(.darkGreen)
            Text("Username")
            TextField("", text: $username)
                .frame(width: 300, height: 50)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
                
            Text("E-mail")
            TextField("", text: $email)
                .frame(width: 300, height: 50)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            
            Text("Phone Number")
            TextField("", text: $phoneNumber)
                .frame(width: 300, height: 50)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            
            Text("Password")
            SecureField("", text: $password)
                .frame(width: 300, height: 50)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            Button("Sign Up", action:{
                print("pressed sign up")
                //TODO: input validation
                signUpViewModel.createAccount(username: username, email: email, phoneNumber: phoneNumber, password: password)
            })
            .frame(width: 300, height: 50)        .background(Color.darkGreen)
            .foregroundStyle(.grayishWhite)
            .bold()
            .cornerRadius(15)
            .padding()
            
            
                
            
        }
    }
}

#Preview {
    SignUpView()
}

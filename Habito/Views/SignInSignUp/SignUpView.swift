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
    @State var shouldEnterApp = false
    
    @Binding var isLoggedIn : Bool
    
    var body: some View {
            VStack{
                Text("Create Account")
                    .padding(.bottom)
                Text("Let's create an account for you!")
                    .padding(.bottom)
                    .bold()
                    .foregroundStyle(.darkGreen)
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
                
                
                
                    .padding(.leading)
                    .padding(.trailing)
                Button("Sign Up", action:{
                    print("pressed sign up")
                    //TODO: have failed validation affect the UI
                    if signUpViewModel.usernameIsntValid(username: username){
                        print("username validation failed")
                    } else if signUpViewModel.emailIsntValid(email: email){
                        print("email validation failed")
                    } else if signUpViewModel.phonenumberIsntValid(phoneNumber: phoneNumber){
                        print("phone number validation")
                    } else if signUpViewModel.passwordIsntValid(password: password) {
                        print("password validation failed")
                    } else {
                        signUpViewModel.createAccount(username: username, email: email, phoneNumber: phoneNumber, password: password)
                        isLoggedIn = true
                    }
                })
                .frame(maxWidth: .infinity, minHeight: 50)        .background(Color.darkGreen)
                .foregroundStyle(.grayishWhite)
                .bold()
                .cornerRadius(15)
                .padding()
                
            }.frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 20)
    }
}

#Preview {
    @Previewable @State var login = false
    
    SignUpView(isLoggedIn: $login)
}

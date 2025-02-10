//
//  SignInView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    @State var isPresenting = false
    @Binding var isLoggedIn : Bool
    var body: some View {
        VStack {
            Image("sanjose.jpg")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            Text("Welcome Back!")
                .font(Font.custom("", size: 30))
                .padding(.bottom)
            Text("Log in to continue building your healthy habits")
                .padding(.bottom)
            Text("E-mail")
            TextField("Username",text: $username)
                .frame(width: 300, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius : 15)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(.blue)
                )
                .padding(.bottom)
            Text("Password")
            SecureField("Password",text: $password)
                .frame(width: 300, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius : 15)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(.blue)
            )
                .padding(.bottom)
            Button("Login"){
                isLoggedIn = true
            }
                .buttonStyle(.borderedProminent)
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    @State static var isLoggedIn = false
    
    static var previews: some View {
        SignInView(isLoggedIn: $isLoggedIn)
    }
}

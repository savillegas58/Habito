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
    @State var returnToOnboarding: Bool = false
    @Binding var isLoggedIn : Bool
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    returnToOnboarding = true
                })
                {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }.padding(.leading, 25)
                    .padding(.top, -45)
                    .fullScreenCover(isPresented: $returnToOnboarding) {
                    Onboarding3(isLoggedIn: $isLoggedIn)
                    }
                Spacer()
            }

                              
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            TextField("Username",text: $username)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            SecureField("Password",text: $password)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)

            Button("Login", action: {
                //check to make sure all text entries have been filled out

                if SignInViewModel.signInViewModel.providedCredentialAreValid(username: username, password: password) {
                    isLoggedIn = true
                } else {
                    //dispaly seom sort of notificaton
                }
            })
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.darkGreen)
            .foregroundStyle(.grayishWhite)
            .bold()
            .cornerRadius(15)
            .padding()


        }
    }
}

struct SignInView_Previews: PreviewProvider {
    @State static var isLoggedIn = false
    
    static var previews: some View {
        SignInView(isLoggedIn: $isLoggedIn)
    }
}

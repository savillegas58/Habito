//
//  Onboarding3.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import SwiftUI

struct Onboarding3: View {
    @Binding var isLoggedIn : Bool// = false
    @State var showSignUp : Bool = false
    @State var showSignIn : Bool = false
    var body: some View {
        VStack{
            if showSignUp {
                SignUpView(isLoggedIn: $isLoggedIn)
            } else if showSignIn{
                SignInView(isLoggedIn: $isLoggedIn)
            } else {
            HStack {
                Text("Welcome to")
                    .font(.title)
                Text("Habito")
                    .font(.title)
                    .foregroundStyle(.darkGreen)
            }.padding()
            Text("Build healthy habits, track your")
                .bold()
                .foregroundStyle(.gray)
            Text("progress, and stay motivated every day.")
                .bold()
                .foregroundStyle(.gray)
            Button("GET STARTED", action: {
                print("GET STARTED pressed")
                self.showSignUp = true
            })
            .frame(width: 300, height: 50)
            .background(.darkGreen)
            .foregroundStyle(.grayishWhite)
            .bold()
            .cornerRadius(15)
            .padding()
            HStack {
                Text("Already have and account?")
                Button(action: {
                    print("Sign in pressed.")
                    self.showSignIn = true
                }){
                    Text("Sign In")
                }
                .bold()
                .foregroundStyle(.darkGreen)
            }
        }
        }
    }
}

#Preview {
    //Onboarding3()
}

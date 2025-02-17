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
                //Habito logo?
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
            Image(uiImage: UIImage(named: "people_walking_onboarding1.png")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .opacity(0.8)
                
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

struct Onboarding3_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    
    static var previews: some View {
        Onboarding3(isLoggedIn: $isLoggedIn)
    }
}

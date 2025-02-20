//
//  SignInView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    @State var isPresenting = false
    @State var returnToOnboarding: Bool = false
    @Binding var isLoggedIn : Bool
    @State var thereIsCredentialError = false
    @State var credentiaulErrorMessage = ""
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
                    .padding(.top, -100)
                    .fullScreenCover(isPresented: $returnToOnboarding) {
                    Onboarding3(isLoggedIn: $isLoggedIn)
                    }
                Spacer()
            }

            

            Text("Habit Helper")
                .font(Font.custom( "", size: 50))
                .foregroundColor(.darkGreen)
                .padding(.bottom, 50)

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
                .accessibilityIdentifier( "usernameTextField" )
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .accessibilityIdentifier("passwordTextField")
            SecureField("Password",text: $password)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)

            Button("Login", action: {
                //check to make sure all text entries have been filled out

                if SignInViewModel.signInViewModel.providedCredentialAreValid(username: username, password: password) {
                    isLoggedIn = true
                    thereIsCredentialError = false
                } else {
                    thereIsCredentialError = true
                }

            })
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.darkGreen)
            .foregroundStyle(.grayishWhite)
            .bold()
            .cornerRadius(15)
            .padding()
            
            if thereIsCredentialError {
                Text("Username or Password is incorrect")
                    .bold()
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }
            
            Text("Or login with")
            
            HStack{
                Spacer()
                Button
                {
                    googleSignIn()
                } label: {
                    Image(uiImage: UIImage(named: "google.png")!)
                        .resizable()
                        .background(Color.white)
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                }
                Spacer()
                Button
                {
                    print("Apple Sign In")
                } label: {
                    Image(uiImage: UIImage(named: "apple.png")!)
                        .resizable()
                        .background(Color.white)
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        
                }
                Spacer()
            }

            

        }
    }
    
    
    func googleSignIn(){
        let clientID = "628229680192-47eoc1ot1an4i6hdm2lcpm25sq9pebrq.apps.googleusercontent.com"

        let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config

            guard let presentingVC = UIApplication.shared.windows.first?.rootViewController else {
                print("Error: No presenting view controller found")
                return
            }

            GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
                if let error = error {
                    print(" Google Sign-In failed: \(error.localizedDescription)")
                    return
                }

                guard let user = result?.user else {
                    print("Error: User data is nil")
                    return
                }
                isLoggedIn = true
                print(" Google Sign-In successful!")
                print("User ID: \(user.userID ?? "N/A")")
                print(" Email: \(user.profile?.email ?? "N/A")")
                print("Name: \(user.profile?.name ?? "N/A")")
            }
        print("method ended")
        }
    
}

struct SignInView_Previews: PreviewProvider {
    @State static var isLoggedIn = false
    
    static var previews: some View {
        SignInView(isLoggedIn: $isLoggedIn)
    }
}

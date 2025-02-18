//
//  SignUpView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI
import GoogleSignIn

struct SignUpView: View {
    var signUpViewModel = SignUpViewModel()
    @State var username: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var shouldEnterApp = false
    @State var returnToOnboarding: Bool = false
    @Binding var isLoggedIn : Bool
    
    var body: some View {
            VStack{
                Text("Create Account")
                    .padding(.bottom)
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
                
                
            }.frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 20)
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

#Preview {
    @Previewable @State var login = false
    
    SignUpView(isLoggedIn: $login)
}

//
//  PersonalDataView.swift
//  Habito
//
//  Created by squiggly on 2/11/25.
//

import SwiftUI

struct PersonalDataView: View {
    @State var username: String = "Username"
    @State var email: String = "Password"
    @State var phoneNumber: String = "123-456-7890"
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    @State var image: UIImage?
    var body: some View {
        VStack{
            Spacer()
            Image(uiImage: image ?? UIImage(named: "headshot_icon.jpg")!)
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .shadow(radius: 3)
                .frame(width: 250, height: 250)
            
            Spacer()

            Text("Username")
                .frame(maxWidth: .infinity, alignment: .center)
                
            
            //Used to be the the username text field
            Text(username)
                .textFieldStyle(CustomTextFieldStyle())
                .frame(maxWidth: 250, alignment: .center)
                .padding()
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color(UIColor.darkGreen), lineWidth: 3))
            
            Text("E-mail")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
            
            //Used to be the email text field
            Text(email)
                .textFieldStyle(CustomTextFieldStyle())
                .frame(maxWidth: 250, alignment: .center)
                .padding()
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color(UIColor.darkGreen), lineWidth: 3))
        
            Text("Phone Number")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top,20)
            
            //Used to be the phone number text field
            Text(phoneNumber)
                .textFieldStyle(CustomTextFieldStyle())
                .frame(maxWidth: 250, alignment: .center)
                .padding()
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color(UIColor.darkGreen), lineWidth: 3))
            
            Spacer()
            
        }.navigationTitle("Personal Data")
    }
}

#Preview {
    PersonalDataView()
}

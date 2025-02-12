//
//  SignUpViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class SignUpViewModel {
    
    //This will fail right now because the database isn't being created anywhere
    func createAccount(username: String, email: String, phoneNumber: String, password: String) {
        //TODO: Create account and assign its default data
        do {
            try DatabaseAccountInserter.accountInserter.insertAccount(username: username, password: password, phoneNumber: phoneNumber, email: email)
        } catch {
            print("Encounter database error when attempting to create acount: \(error)")
            return
        }
        print("Account successfully added.")
    }
}

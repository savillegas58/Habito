//
//  LoginViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class SignInViewModel {
    static var signInViewModel = SignInViewModel()
    
    private init(){}
    
    func providedCredentialAreValid(username: String, password: String) -> Bool {
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: username)
        
        if(fetchedAccount != nil) {
            if fetchedAccount?.password == password {
                print("Login successful")
                persistAccountId(fetchedAccountID: (fetchedAccount?.ID)!)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private func persistAccountId(fetchedAccountID : Int) {
        UserDefaults.standard.set(fetchedAccountID, forKey: "currentAccountID")
    }
    
    
}

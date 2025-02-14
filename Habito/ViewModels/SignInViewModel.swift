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
                print("Loggin successful")
                persistAccountId(fetchedAccountID: (fetchedAccount?.ID)!)
                return true
            }
        } else {
            print("Account with username not found")
            return false
        }

        //try to fetch user, if done check if password matches set account id in user default and return true
        return true
    }
    
    private func persistAccountId(fetchedAccountID : Int) {
        UserDefaults.standard.set(fetchedAccountID, forKey: "currentAccountID")
    }
    
    
}

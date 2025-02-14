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
        //try to fetch user, if done check if password matches set account id in user default and return true
        return true
    }
}

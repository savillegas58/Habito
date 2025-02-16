//
//  EditProfileViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class EditProfileViewModel {
    let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
    
    func changeAccountUsername(newUsername: String) {
        do {
            try DatabaseAccountUpdater.accountUpdater.updateAccountUsername(accountID: currentAccountID, newUsername: newUsername)
        } catch {
            print("Error updating account username.")
        }
    }
    
    func changeAccountPassword(newPassword: String) {
        do {
            try DatabaseAccountUpdater.accountUpdater.updateAccountPassword(accountID: currentAccountID, password: newPassword)
        } catch {
            print("Error updating password")
        }
    }
}

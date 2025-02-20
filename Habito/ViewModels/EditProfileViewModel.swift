//
//  EditProfileViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class EditProfileViewModel {
    static var profileEditor = EditProfileViewModel()
    
    let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
    
    private init() {}
    
    func getCurrentAccount() -> Account? {
        let currentID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        let account = DatabaseAccountFetcher.accountFetcher.fetchAccountByID(accountID: String(currentID))
        
        return account
    }
    
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
    
    func changeAccountPhonenumber(newPhonenumber: String) {
        do {
            try DatabaseAccountUpdater.accountUpdater.updateAccountPhoneNumber(accountID: currentAccountID, newPhonenumber: newPhonenumber)
        } catch {
            print("Error updateing account phone number")
        }
    }
    
    func changeAccountEmail(newEmail: String) {
        do {
            try DatabaseAccountUpdater.accountUpdater.updateAccountEmail(accountID: currentAccountID, newEmail: newEmail)
        } catch {
            print("Error updating account email")
        }
    }
    
    func updateProfilePicture(newLink: String) {
        do {
            try DatabaseAccountUpdater.accountUpdater.updateAccountProfilePictureLink(accountID: currentAccountID, newProfilePictureLink: newLink)
        } catch {
            print("Error updating account profile picutre link")
        }
    }
}

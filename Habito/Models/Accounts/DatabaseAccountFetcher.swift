//
//  DatabaseFetcher.swift
//  Habito
//
//  Created by admin on 2/10/25.
//

import Foundation
import SQLite3

class DatabaseAccountFetcher {
    static var accountFetcher = DatabaseAccountFetcher()
    var accountList = [Account]()
    
    private init() {}
    
    ///fetchAllAccounts()
    ///no arguments
    ///returns an array of Account objects
    ///throws DatabaseErorrs.FetchingError
    ///This method retrieves all accounts from the database and returns them as an array of Account objects.
    func fetchAllAccounts() throws -> [Account] {
        accountList.removeAll()
        
        var accountStatment : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let accountQuery = "SELECT * FROM account"
        
        if sqlite3_prepare_v2(db, accountQuery, -1, &accountStatment, nil) != SQLITE_OK {
            throw DatabaseErrors.FetchingError("Error fetching all accounts from the database")
        }
        
        while(sqlite3_step(accountStatment) == SQLITE_ROW) {
            let ID = Int(sqlite3_column_int(accountStatment, 0))
            let username = String(cString: sqlite3_column_text(accountStatment, 1))
            let password = String(cString: sqlite3_column_text(accountStatment, 2))
            let phoneNumber = String(cString: sqlite3_column_text(accountStatment, 3))
            let email = String(cString: sqlite3_column_text(accountStatment, 4))
            let profilePictureLink = String(cString: sqlite3_column_text(accountStatment, 5))
            
            let fetchedAccount = Account(ID: ID, username: username, password: password, phoneNumber: phoneNumber, email: email, profilePictureLink: profilePictureLink)
            accountList.append(fetchedAccount)
        }
        return accountList
    }
    
    ///fetchAccountByUsername(username:)
    ///arguments: username, a string that respresnts the username of the account being searched for
    ///returns: an OPTIONAL account object. If no account is found it returns nil
    ///throws nothing
    ///Used to search for an account using a provided username. If no account is found it will return nil.
    func fetchAccountByUsername(username: String) -> Account? {
        var accountStatment : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let accountQuery = "SELECT * FROM account WHERE username = '\(username)'"
        var fetchedAccount : Account?
        
        if sqlite3_prepare(db, accountQuery, -1, &accountStatment, nil) == SQLITE_OK {
            
            while(sqlite3_step(accountStatment) == SQLITE_ROW){
                let fetchedID = Int(sqlite3_column_int(accountStatment, 0))
                let fetchedUsername = String(cString: sqlite3_column_text(accountStatment, 1))
                let fetchedPassword = String(cString: sqlite3_column_text(accountStatment, 2))
                let fetchedPhoneNumber = String(cString: sqlite3_column_text(accountStatment, 3))
                let fetchedEmail = String(cString: sqlite3_column_text(accountStatment, 4))
                let fetchedProfilePictureLink = String(cString: sqlite3_column_text(accountStatment, 5))
                fetchedAccount = Account(ID: fetchedID, username: fetchedUsername, password: fetchedPassword, phoneNumber: fetchedPhoneNumber, email: fetchedEmail, profilePictureLink: fetchedProfilePictureLink)
            }
        } else {
            print("No account found")
        }
        
        return fetchedAccount
    }
}

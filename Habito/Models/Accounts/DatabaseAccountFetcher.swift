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
            //this id stuff is untested
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
}

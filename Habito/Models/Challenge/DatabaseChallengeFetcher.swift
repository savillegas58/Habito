//
//  DatabaseChallengeFetcher.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation
import SQLite3

class DatabaseChallengeFetcher {
    static var challengeFetcher = DatabaseChallengeFetcher()
    private var challengeList = [Challenge]()
    
    func fetchAccountsChallenges(accountID: Int) throws -> [Challenge]{
        let db = DatabaseFoundation.databaseFoundation.db
        let fetchQuery = "SELECT * FROM challenge WHERE accountID = '\(accountID)'"
        var fetchStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, fetchQuery, -1, &fetchStatement, nil) != SQLITE_OK {
            throw DatabaseErrors.FetchingError("Error fetching challenges")
        }
        
        while(sqlite3_step(fetchStatement) == SQLITE_ROW) {
            let fetchedAccountID = Int(sqlite3_column_int(fetchStatement, 0))
            let name = String(cString: sqlite3_column_text(fetchStatement, 1))
            let currentProgress = Int(sqlite3_column_int(fetchStatement, 2))
            let goal = Int(sqlite3_column_int(fetchStatement, 3))
            let date = String(cString: sqlite3_column_text(fetchStatement, 4))
            
            let fetchedChallenge = Challenge(accountID: fetchedAccountID, name: name, currentProgress: currentProgress, goal: goal, date: date)
            challengeList.append(fetchedChallenge)
        }
        
        return challengeList
    }
    
}

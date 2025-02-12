//
//  InitialViewModel.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation

///This is a kind of sloppy way to initialize the database when the app starts
class InitialViewModel {
    init(){
        do {
            try DatabaseFoundation.databaseFoundation.createDatabase()
        } catch {
            print("Databasse failed to initialize: '\(error)'")
            return
        }
        
        print("Database Initialized successfuly")
    }
}

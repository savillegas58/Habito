//
//  DatabaseErrors.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

enum DatabaseErrors :  Error {
    case DatabaseCreationError(String)
    case TableCreationError(String)
    case InsertionError(String)
    case FetchingError(String)
    case DeletionError(String)
}

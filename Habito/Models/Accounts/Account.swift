//
//  AccountModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class Account {
    var ID : Int?
    var username : String?
    var password : String?
    var phoneNumber: String?
    var email: String?
    var profilePictureLink: String?
    
    init(ID: Int, username: String, password : String, phoneNumber: String, email: String, profilePictureLink: String) {
        self.username = username
        self.password = password
        self.phoneNumber = phoneNumber
        self.email = email
        self.profilePictureLink = profilePictureLink
    }
}

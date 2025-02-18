//
//  SignUpViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class SignUpViewModel {
    private var createdAccountID : Int?
    
    func usernameIsntValid(username: String) -> Bool{
        if username.isEmpty {
            return true
        }
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: username)

        if fetchedAccount != nil {
            return true
        }
        return false
    }
    
    func phonenumberIsntValid(phoneNumber: String) -> Bool {
        if phoneNumber.isEmpty {
            return true
        } else if phoneInvalidFormat(phoneNumber: phoneNumber){
            return true
        }
        return false
    }
    
    //regex curtosey of Ravi K Thapliyal of stackoverflow
    private func phoneInvalidFormat(phoneNumber: String) -> Bool {
        let regex = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]\\d{3}[\\s.-]\\d{4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return !predicate.evaluate(with: phoneNumber)
    }
    
    func emailIsntValid(email: String) -> Bool {
        if email.isEmpty{
            return true
        } else if emailInvalidFormat(email: email){
            return true
        }
        return false
    }
    
    private func emailInvalidFormat(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return !predicate.evaluate(with: email)
    }
    
    func passwordIsntValid(password: String) -> Bool {
        if password.isEmpty {
            return true
        } else if password.count < 8 {
            return true
        } else if passwordDoesntContainANumber(password: password){
            return true
        } else if paswordDoesntContainASpecialCharacter(password: password) {
            return true
        }
        return false
    }
    
    private func passwordDoesntContainANumber(password: String) -> Bool{
        let numberRegex = /[0-9]/
        let passwordDoesntContainANumber = password.matches(of: numberRegex).isEmpty
        return passwordDoesntContainANumber
    }
    
    private func paswordDoesntContainASpecialCharacter(password: String) -> Bool {
        let characterRegex = /[^(A-Za-z0-9)]/
        let passwordDoesntContainSpecialCharacter = password.matches(of: characterRegex).isEmpty
        return passwordDoesntContainSpecialCharacter
    }
    
    func createAccount(username: String, email: String, phoneNumber: String, password: String) {
        do {
            try DatabaseAccountInserter.accountInserter.insertAccount(username: username, password: password, phoneNumber: phoneNumber, email: email)
            let createdAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: username)
            createdAccountID = createdAccount?.ID
        } catch {
            print("Encountered database error when attempting to create acount: \(error)")
            return
        }
        populateDefaultHabits()
        populateDefaultChallenges()
        print("Account successfully added.")
        //persisting the accontID here will be unessesary if we transition from sign up to the log in screen, but otherwise it will need to be done
        persistAccountID()
    }
    
    private func persistAccountID() {
        UserDefaults.standard.set(createdAccountID, forKey: "currentAccountID")
    }
    
    //this is is just placeholder data for now
    private func populateDefaultHabits() {
        do {
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Drinking", currentProgress: 0, goal: 8, type: HabitType.drinking, date: "2-17-2025")
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Walking", currentProgress: 0, goal: 10, type: HabitType.walking, date: "2-17-2025")
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Sleep", currentProgress: 0, goal: 8, type: HabitType.sleeping, date: "2-17-2025")
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Exercise", currentProgress: 0, goal: 20, type: HabitType.exercising, date: "2-17-2025")
        } catch {
            print("Encountered database error when attemping to add default habits to new account: \(error)")
            return
        }
    }
    
    //this is just placehodler data for now
    private func populateDefaultChallenges() {
        do {
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 1", currentProgress: 0, goal: 10, date: "1")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 2", currentProgress: 0, goal: 10, date: "2")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 3", currentProgress: 0, goal: 10, date: "3")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 4", currentProgress: 0, goal: 10, date: "4")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 5", currentProgress: 0, goal: 10, date: "5")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 6", currentProgress: 0, goal: 10, date: "6")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 7", currentProgress: 0, goal: 10, date: "7")
            //TODO: minimum of 15
        } catch {
            print("Encountered database error when attempting to add default habits to new account: \(error)")
        }
    }
}

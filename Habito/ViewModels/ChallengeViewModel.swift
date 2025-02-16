//
//  ChallengeViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class ChallengeViewModel {
    func getAccountChalenges() -> [Challenge] {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID");
        var challegneList = [Challenge]()
        
        do {
            challegneList = try DatabaseChallengeFetcher.challengeFetcher.fetchAccountsChallenges(accountID: currentAccountID)
        } catch {
            print("Error fetching challenges in ChallengeViewModel")
        }
        
        return challegneList
    }
}

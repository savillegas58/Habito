//
//  HabitDataPoint.swift
//  Habito
//
//  Created by Saul on 2/12/25.
//

import Foundation

struct HabitDataPoint: Identifiable {
    var id = UUID().uuidString
    var hours: Int
    var day: String
    
}

//
//  Day.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 12/04/2024.
//

import Foundation

struct Day {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    static let sampleData = [
        Day(day: "Mon", isRainy: false, high: 70, low: 50),
        Day(day: "Tue", isRainy: true, high: 60, low: 40),
        Day(day: "Wed", isRainy: true, high: 58, low: 34),
        Day(day: "Thu", isRainy: false, high: 65, low: 40),
        Day(day: "Fri", isRainy: false, high: 83, low: 48),
        Day(day: "Sat", isRainy: false, high: 73, low: 45),
        Day(day: "Sun", isRainy: true, high: 60, low: 40)
    ]
}

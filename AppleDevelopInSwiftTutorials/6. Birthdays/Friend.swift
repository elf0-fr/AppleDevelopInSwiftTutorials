//
//  Friend.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    var favoriteMovie: Movie?
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
    
    private static var dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    static let sampleData = [
        Friend(name: "Elena", birthday: .now),
        Friend(name: "Graham", birthday: .init(timeIntervalSince1970: 0)),
        Friend(name: "Mayuri", birthday: dateFormatter.date(from: "2016/10/08")!),
        Friend(name: "Rich", birthday: dateFormatter.date(from: "1984/06/15")!),
        Friend(name: "Rody", birthday: dateFormatter.date(from: "1997/01/16")!)
    ]
}

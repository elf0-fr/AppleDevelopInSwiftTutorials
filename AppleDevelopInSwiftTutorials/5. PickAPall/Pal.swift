//
//  Pal.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 13/04/2024.
//

import Foundation
import SwiftData

@Model
class Pal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Pal(name: "Elisha"),
        Pal(name: "Andre"),
        Pal(name: "Jasmine"),
        Pal(name: "Po-Chun"),
    ]
}

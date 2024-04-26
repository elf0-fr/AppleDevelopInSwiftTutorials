//
//  Message.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 12/04/2024.
//

import Foundation

enum MessageOrigin {
    case sender
    case receiver
}

struct Message {
    let content: String
    let origin: MessageOrigin
    
    static let sampleData = [
        Message(content: "Knock, knock!", origin: .sender),
        Message(content: "Who's there?", origin: .receiver),
        Message(content: "Nobel", origin: .sender),
        Message(content: "Nobel who?", origin: .receiver),
        Message(content: "Nobel... that's why I knocked", origin: .sender)
    ]
}

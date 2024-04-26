//
//  ChatBubble.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 12/04/2024.
//

import SwiftUI

struct ChatBubble: View {
    let message: Message
    
    var color: Color {
        message.origin == .receiver
        ? .teal : .yellow
    }
    
    var body: some View {
        Text(message.content)
            .padding()
            .background(color, in: RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5, y: 5)
    }
}

#Preview {
    ChatBubble(message: Message.sampleData[0])
}

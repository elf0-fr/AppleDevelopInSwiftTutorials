//
//  ChatPrototypeContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 11/04/2024.
//

import SwiftUI

struct ChatPrototypeContentView: View {
    let discussion: [Message]
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(discussion, id: \.content) { message in
                HStack {
                    if message.origin == .sender {
                        Spacer()
                    }
                    ChatBubble(message: message)
                    if message.origin == .receiver {
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ChatPrototypeContentView(discussion: Message.sampleData)
}

//
//  BirthdayList.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 13/04/2024.
//

import SwiftUI
import SwiftData

struct BirthdayList: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Group {
            if friends.isEmpty {
                ContentUnavailableView {
                    Label("No Birthdays", systemImage: "birthday.cake")
                }
            } else {
                List(friends) { friend in
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "birthday.cake")
                        }
                        
                        Text(friend.name)
                            .bold(friend.isBirthdayToday)
                        
                        Spacer()
                        
                        Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    }
                }
            }
        }
        .navigationTitle("Birthdays")
    }
}

#Preview {
    NavigationStack {
        BirthdayList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("No birthday") {
    NavigationStack {
        BirthdayList()
    }
}

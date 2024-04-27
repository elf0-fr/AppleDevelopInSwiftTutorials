//
//  BirthdaysContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import SwiftUI
import SwiftData

struct BirthdaysContentView: View {
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            BirthdayList()
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(
                        selection: $newDate,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    ) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    BirthdaysContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

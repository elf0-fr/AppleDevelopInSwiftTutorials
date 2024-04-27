//
//  FilteredFriendList.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 13/04/2024.
//

import SwiftUI

enum FriendSortMode: String {
    case name
    case birthday
}

struct FilteredFriendList: View {
    @State private var searchText = ""
    @State private var sortMode = FriendSortMode.name
    
    @State private var showBirthday = false
    
    var body: some View {
        NavigationSplitView {
            FriendList(nameFilter: searchText, sortedBy: sortMode)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Menu("Filter by \(sortMode.rawValue)") {
                            Button("name") {
                                sortMode = .name
                            }
                            Button("birthday") {
                                sortMode = .birthday
                            }
                        }
                        .menuStyle(.button)
                        .buttonStyle(.borderedProminent)
                    }
                    
                    ToolbarItem(placement: .navigation) {
                        Button("Birthday", systemImage: "birthday.cake") {
                            showBirthday = true
                        }
                    }
                }
                .sheet(isPresented: $showBirthday) {
                    NavigationStack {
                        BirthdayList()
                    }
                }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
}

#Preview {
    FilteredFriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

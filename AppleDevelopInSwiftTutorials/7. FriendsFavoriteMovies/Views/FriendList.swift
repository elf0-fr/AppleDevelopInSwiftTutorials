//
//  FriendList.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 09/04/2024.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    @State private var newFriend: Friend?
    
    init(nameFilter: String = "", sortedBy: FriendSortMode = .name) {
        let predicate = #Predicate<Friend> { friend in
            nameFilter.isEmpty
            || friend.name.localizedStandardContains(nameFilter)
        }
        
        switch sortedBy {
        case .name:
            _friends = Query(filter: predicate, sort: \Friend.name)
        case .birthday:
            _friends = Query(filter: predicate, sort: \Friend.birthday)
        }
    }
    
    var body: some View {
        Group {
            if !friends.isEmpty {
                List {
                    ForEach(friends) { friend in
                        NavigationLink {
                            FriendDetail(friend: friend)
                                .navigationTitle("Friend")
                        } label: {
                            Text(friend.name)
                        }
                    }
                    .onDelete(perform: deleteFriends)
                }
            } else {
                ContentUnavailableView {
                    Label("No Friends", systemImage: "person.and.person")
                }
            }
        }
        .navigationTitle("Friends")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            
            ToolbarItem {
                Button(action: addFriend) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newFriend) { friend in
            NavigationStack {
                FriendDetail(friend: friend, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addFriend() {
        withAnimation {
            let newItem = Friend(name: "", birthday: .now)
            modelContext.insert(newItem)
            newFriend = newItem
        }
    }
    
    private func deleteFriends(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(friends[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("No Friend") {
    NavigationStack {
        FriendList()
            .modelContainer(for: [Friend.self], inMemory: true)
    }
}

#Preview("Filtered") {
    NavigationStack {
        FriendList(nameFilter: "gr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

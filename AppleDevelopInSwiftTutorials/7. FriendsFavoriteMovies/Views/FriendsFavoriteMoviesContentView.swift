//
//  FriendsFavoriteMoviesContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 10/04/2024.
//

import SwiftUI

struct FriendsFavoriteMoviesContentView: View {
    var body: some View {
        TabView {
            FilteredMovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FilteredFriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    FriendsFavoriteMoviesContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("No models") {
    FriendsFavoriteMoviesContentView()
        .modelContainer(for: models, inMemory: true)
}

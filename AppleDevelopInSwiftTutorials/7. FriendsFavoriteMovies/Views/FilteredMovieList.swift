//
//  FilteredMovieList.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 10/04/2024.
//

import SwiftUI

enum MovieSortMode: String {
    case title
    case releaseData = "release date"
}

struct FilteredMovieList: View {
    @State private var searchText = ""
    @State private var sortMode = MovieSortMode.title
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText, sortedBy: sortMode)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Menu("Filter by \(sortMode.rawValue)") {
                            Button("Title") {
                                sortMode = .title
                            }
                            Button("Release date") {
                                sortMode = .releaseData
                            }
                        }
                        .menuStyle(.button)
                        .buttonStyle(.borderedProminent)
                    }
                }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

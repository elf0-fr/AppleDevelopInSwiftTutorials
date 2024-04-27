//
//  MovieList.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]
    
    @State private var newMovie: Movie?
    
    init(titleFilter: String = "", sortedBy: MovieSortMode = .title) {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty
            || movie.title.localizedStandardContains(titleFilter)
        }
        
        switch sortedBy {
        case .title:
            _movies = Query(filter: predicate, sort: \Movie.title)
        case .releaseData:
            _movies = Query(filter: predicate, sort: \Movie.releaseDate)
        }
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            Text(movie.title)
                        }
                    }
                    .onDelete(perform: deleteMovies)
                }
            } else {
                ContentUnavailableView {
                    Label("No Movies", systemImage: "film.stack")
                }
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: addMovie) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            modelContext.insert(newItem)
            newMovie = newItem
        }
    }

    private func deleteMovies(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

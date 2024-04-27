//
//  AppleDevelopInSwiftTutorialsApp.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import SwiftUI
import SwiftData

@main
struct AppleDevelopInSwiftTutorialsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pal.self,
            Movie.self,
            Friend.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

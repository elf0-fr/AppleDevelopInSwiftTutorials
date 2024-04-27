//
//  SampleData.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import Foundation
import SwiftData

let models: [any PersistentModel.Type] = [
   Pal.self,
   Movie.self,
   Friend.self
]

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
    
    var friend: Friend {
        Friend.sampleData[0]
    }
    
    private init() {
        let schema = Schema(models)
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for pal in Pal.sampleData {
            context.insert(pal)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
        
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
}

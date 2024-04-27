//
//  ContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Onboarding") private var isOnboarded = false
    
    var body: some View {
        if isOnboarded {
            TabView {
                Group {
                    FilteredFriendList()
                        .tabItem {
                            Label("Friends", systemImage: "person.and.person")
                        }
                    
                    FilteredMovieList()
                        .tabItem {
                            Label("Movies", systemImage: "film.stack")
                        }
                    
                    NavigationStack {
                        PickAPallContentView()                        
                    }
                        .tabItem {
                            Label("Dice Roller", systemImage: "person.3")
                        }
                    
                    DiceRollerContentView()
                        .tabItem {
                            Label("Dice Roller", systemImage: "dice")
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
            }
        }
        else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("No model") {
    ContentView()
        .modelContainer(for: models, inMemory: true)
}



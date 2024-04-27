//
//  FeaturesPage.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 03/04/2024.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(
                iconName: "person.2.crop.square.stack.fill",
                description: "Add your friends contact information (name, birthday, favorite movie) "
            )
            
            FeatureCard(
                iconName: "film.stack.fill",
                description: "List movies to watch with your friends"
            )
            
            FeatureCard(
                iconName: "dice.fill",
                description: "Play board game with dice"
            )
            
            FeatureCard(
                iconName: "person.3.fill",
                description: "Pick a random friend"
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}

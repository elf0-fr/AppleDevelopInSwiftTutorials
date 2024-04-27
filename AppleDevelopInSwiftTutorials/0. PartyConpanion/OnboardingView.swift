//
//  OnboardingView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 26/04/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("Onboarding") private var isOnboarded = false
    
    var body: some View {
        VStack {
            TabView {
                WelcomePage()
                FeaturesPage()
            }
            .tabViewStyle(.page)
            
            Button {
                isOnboarded = true
            } label: {
                Text("Get Started")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
            }
            .buttonStyle(.borderedProminent)
        }
        .foregroundStyle(.white)
        .background(Gradient(colors: gradientColors))
    }
}

#Preview {
    OnboardingView()
}

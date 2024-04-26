//
//  PageTabView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 05/04/2024.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct OnboardingFlowContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    OnboardingFlowContentView()
}

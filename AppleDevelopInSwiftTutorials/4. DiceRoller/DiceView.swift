//
//  DiceView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 03/04/2024.
//

import SwiftUI

struct DiceView: View {
    let numberOfPips: Int
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
        }
    }
}

#Preview {
    DiceView(numberOfPips: 1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.appBackground)
        .background(Gradient(colors: [.gradientTop, .appBackground]))
}

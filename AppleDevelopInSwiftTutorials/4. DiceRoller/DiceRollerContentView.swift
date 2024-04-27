//
//  DiceRollerContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 05/04/2024.
//

import SwiftUI

struct DiceRollerContentView: View {
    @State private var numberOfDice: Int = 1
    @State private var pips = Array(repeating: 1, count: 6)
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1...numberOfDice, id: \.self) { index in
                    DiceView(numberOfPips: pips[index])
                }
            }
            .onTapGesture {
                withAnimation {
                    rollDice()
                }
            }
            
            HStack {
                Button(
                    "Remove Dice",
                    systemImage: "minus.circle.fill"
                ) {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                .symbolRenderingMode(
                    numberOfDice == 1
                    ? .monochrome
                    :.multicolor
                )
                
                Button(
                    "Add Dice",
                    systemImage: "plus.circle.fill"
                ) {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 5)
                .symbolRenderingMode(
                    numberOfDice == 5
                    ? .monochrome
                    :.multicolor
                )
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: [.gradientTop, .appBackground]))
        .safeAreaInset(edge: .top) {
            DiceRollerHeader()
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                withAnimation {
                    rollDice()
                }
            } label: {
                Text("Roll")
                    .font(.title3)
                    .padding(.horizontal)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(.white)
            .brightness(0.1)
            .shadow(radius: 10)
            .padding()
        }
    }
    
    private func rollDice() {
        for index in 1...numberOfDice {
            pips[index] = Int.random(in: 1...6)
        }
    }
}

#Preview {
    DiceRollerContentView()
}

struct DiceRollerHeader: View {
    var body: some View {
        VStack {
            Image(systemName: "dice")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 40)
                .foregroundStyle(.tint)
                .symbolRenderingMode(.hierarchical)
            Text("Dice Roller")
                .foregroundStyle(.white)
        }
        .font(.largeTitle.lowercaseSmallCaps())
        .bold()
    }
}

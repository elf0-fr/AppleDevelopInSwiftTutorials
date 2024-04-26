//
//  WelcomePage.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 03/04/2024.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Grid(verticalSpacing: 10) {
                    GridRow {
                        Image(systemName: "figure.2")
                        Image(systemName: "movieclapper")
                    }
                    GridRow {
                        Image(systemName: "dice")
                        Image(systemName: "list.bullet")
                    }
                }
                .font(.system(size: 35))
                .foregroundStyle(.white)
            }
            
            Group {
                Text("Welcome to")
                    .padding(.top)
                Text("PartyCompanion")
            }
            .font(.title)
            .fontWeight(.semibold)
            
            Text("Let's organize and play")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}

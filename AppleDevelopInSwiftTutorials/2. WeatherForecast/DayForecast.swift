//
//  DayForecast.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 11/04/2024.
//

import SwiftUI

struct DayForecast: View {
    let day: Day
    
    var iconName: String {
        day.isRainy
        ? "cloud.rain.fill"
        : "sun.max.fill"
    }
    
    var iconColor: Color {
        day.isRainy
        ? Color.blue
        : Color.yellow
    }
    
    var highColor: Color {
        day.high > 80
        ? .orange
        : .white
    }
    
    var body: some View {
        VStack {
            Text(day.day)
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.subheadline)
                .padding(6)
            
            VStack(alignment: .leading) {
                Text("High: \(day.high)")
                    .fontWeight(.semibold)
                    .foregroundStyle(highColor)
                Text("Low: \(day.low)")
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(5)
    }
}

#Preview {
    Group {
        DayForecast(day: Day.sampleData[0])
        
        DayForecast(day: Day.sampleData[4])
        
        DayForecast(day: Day.sampleData[1])
    }
}

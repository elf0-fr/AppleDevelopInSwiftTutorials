//
//  WeekForecast.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 11/04/2024.
//

import SwiftUI

struct WeekForecast: View {
    let week: [Day]
    
    let gridItems = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var averageHigh: String {
        let sum = week.reduce(.zero) { $0 + $1.high }
        return "\(sum / week.count)"
    }
    
    var averageLow: String {
        let sum = week.reduce(.zero) { $0 + $1.low }
        return "\(sum / week.count)"
    }
    
    var numberDayOfSun: Int {
        week.reduce(.zero) { $0 + (!$1.isRainy ? 1 : 0) }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            RectangleSummary {
            }  content: {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(week, id: \.day) { day in
                            DayForecast(day: day)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            
            Divider()
            
            RectangleSummary {
                Label("Summary", systemImage: "text.bubble")
            }  content: {
                Text("In the coming week the average maximum temperature will be around \(averageHigh)° and the minimum will be around \(averageLow)°. There will be \(numberDayOfSun) days of sun.")
                    .font(.headline)
                    .fontDesign(.serif)
            }
            
            Divider()
            
            LazyVGrid(columns: gridItems) {
                SquareSummary {
                    Label("Average", systemImage: "thermometer.medium")
                } content: {
                    VStack(alignment: .leading) {
                        Text("high: \(averageHigh)°")
                        Text("low: \(averageLow)°")
                    }
                    .fontWeight(.medium)
                }
                
                SquareSummary {
                    Label("Number of", systemImage: "cloud.sun.rain.fill")
                } content: {
                    VStack(alignment: .leading) {
                        Text("sun: \(numberDayOfSun)")
                        Text("rain: \(7 - numberDayOfSun)")
                    }
                    .fontWeight(.medium)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Gradient(colors: gradientColors))
    }
}

#Preview {
    WeekForecast(week: Day.sampleData)
}

struct RectangleSummary<Title: View, Content: View>: View {
    let title: () -> Title
    let content: () -> Content
    
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            title()
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            content()
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.tint)
        }
        .padding(.horizontal)
    }
}

struct SquareSummary<Title: View, Content: View>: View {
    let title: () -> Title
    let content: () -> Content
    
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    title()
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                
                Spacer()
                
                content()
                
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: geometry.size.width)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.tint)
            }
        }
        .padding(.horizontal)
    }
}

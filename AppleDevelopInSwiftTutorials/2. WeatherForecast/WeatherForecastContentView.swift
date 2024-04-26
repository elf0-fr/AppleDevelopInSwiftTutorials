//
//  WeatherForecastContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 11/04/2024.
//

import SwiftUI

struct WeatherForecastContentView: View {
    var body: some View {
        WeekForecast(week: Day.sampleData)
    }
}

#Preview {
    WeatherForecastContentView()
}

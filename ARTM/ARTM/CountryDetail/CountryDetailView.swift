//
//  CountryDetailView.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country

    var body: some View {
        VStack(spacing: 20) {
            Text(country.flag)
                .font(.largeTitle)
            Text(country.name)
                .font(.title)
            Text("Continent: \(country.continent)")
            Text("Population: \(country.population)")
            Text("Capital: \(country.capital)")
        }
        .padding()
        .navigationTitle(country.name)
    }
}

#Preview {
    CountryDetailView(
        country: .init(
            id: UUID(),
            name: "Canada",
            flag: "🇨🇦",
            continent: "America",
            population: 34000000,
            capital: "Ottawa"
        )
    )
}

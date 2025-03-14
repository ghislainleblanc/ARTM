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
            AsyncImage(url: URL(string: country.flag)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
            } placeholder: {
                ProgressView()
            }

            Text("country_detail_continent: \(country.continent)")
            Text("country_detail_population: \(country.population)")
            Text("country_detail_capital: \(country.capital)")
        }
        .padding()
        .navigationTitle(country.name)
    }
}

#Preview {
    CountryDetailView(
        country: Country(
            id: UUID(),
            name: "Canada",
            flag: "https://flagcdn.com/w320/ca.png",
            continent: "North America",
            population: 38005238,
            capital: "Ottawa"
        )
    )
}

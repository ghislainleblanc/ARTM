//
//  CountryService.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

actor CountryService: CountryServiceProtocol {
    private let urlString = "https://restcountries.com/v3.1/all?fields=name,flags,continents,population,capital"
    
    func fetchCountries() async throws -> [Country] {
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode([Country].self, from: data)
    }
}

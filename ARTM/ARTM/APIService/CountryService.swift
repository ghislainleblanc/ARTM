//
//  CountryService.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

actor CountryService: CountryServiceProtocol {
    func fetchCountries() async throws -> [Country] {
        let url = URL(string: "https://example.com/countries")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
}

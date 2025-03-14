//
//  MockCountryService.swift
//  ARTMTests
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation
@testable import ARTM

actor MockCountryService: CountryServiceProtocol {
    var mockResult: Result<[Country], Error>

    init(mockResult: Result<[Country], Error>) {
        self.mockResult = mockResult
    }

    func fetchCountries() async throws -> [Country] {
        switch mockResult {
        case .success(let countries):
            return countries
        case .failure(let error):
            throw error
        }
    }
}

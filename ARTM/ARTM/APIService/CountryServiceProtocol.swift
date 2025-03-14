//
//  CountryServiceProtocol.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

protocol CountryServiceProtocol: Sendable {
    func fetchCountries() async throws -> [Country]
}

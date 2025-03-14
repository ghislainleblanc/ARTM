//
//  CountryListViewModel.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

@MainActor
class CountryListViewModel: ObservableObject {
    @Published private(set) var countries = [Country]()
    @Published private(set) var isLoading = false

    private let service: CountryServiceProtocol

    init(service: CountryServiceProtocol) {
        self.service = service
    }

    func loadCountries() async {
        do {
            isLoading = true

            countries = try await service.fetchCountries()
            
            isLoading = false
        } catch {
            print("Error fetching countries: \(error)")
        }
    }
}

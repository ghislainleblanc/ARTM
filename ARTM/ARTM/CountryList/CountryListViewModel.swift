//
//  CountryListViewModel.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

@MainActor
class CountryListViewModel: ObservableObject {
    @Published var countries = [Country]()

    private let service: CountryServiceProtocol

    init(service: CountryServiceProtocol) {
        self.service = service
    }

    func loadCountries() async {
        do {
            countries = try await service.fetchCountries()
        } catch {
            print("Error fetching countries: \(error)")
        }
    }
}

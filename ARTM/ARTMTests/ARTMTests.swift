//
//  ARTMTests.swift
//  ARTMTests
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation
import Testing
@testable import ARTM

@MainActor
struct ARTMTests {
    private let mockCountries = [
        Country(
            id: UUID(),
            name: "Canada",
            flag: "https://flagcdn.com/w320/ca.png",
            continent: "North America",
            population: 38005238,
            capital: "Ottawa"
        )
    ]

    @Test
    func loadCountries_Success() async throws {
        let mockService = MockCountryService(mockResult: .success(mockCountries))
        let viewModel = CountryListViewModel(service: mockService)

        await viewModel.loadCountries()

        #expect(viewModel.countries.count == 1)
        #expect(viewModel.countries.first?.name == "Canada")
        #expect(viewModel.errorMessage == nil)
        #expect(!viewModel.isLoading)
    }

    @Test
    func loadCountries_Failure() async throws {
        let mockService = MockCountryService(mockResult: .failure(NSError(domain: "TestError", code: 1)))
        let viewModel = CountryListViewModel(service: mockService)

        await viewModel.loadCountries()

        #expect(viewModel.countries.isEmpty)
        #expect(viewModel.errorMessage != nil)
        #expect(!viewModel.isLoading)
    }

    @Test
    func isLoading_State_Success() async throws {
        let mockService = MockCountryService(mockResult: .success([]))
        let viewModel = CountryListViewModel(service: mockService)

        await Task {
            #expect(!viewModel.isLoading)
            await viewModel.loadCountries()
            #expect(!viewModel.isLoading)
        }.value
    }

    @Test
    func loadCountries_isLoading_State_Failure() async throws {
        let mockService = MockCountryService(mockResult: .failure(NSError(domain: "TestError", code: 1)))
        let viewModel = CountryListViewModel(service: mockService)

        await viewModel.loadCountries()

        await Task {
            #expect(!viewModel.isLoading)
            await viewModel.loadCountries()
            #expect(!viewModel.isLoading)
        }.value
    }
}

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
    let mockCountries = [
        Country(
            id: UUID(),
            name: "South Georgia",
            flag: "https://flagcdn.com/w320/gs.png",
            continent: "Antarctica",
            population: 30,
            capital: "King Edward Point"
        )
    ]

    @Test
    func loadCountries_Success() async throws {
        let mockService = MockCountryService(mockResult: .success(mockCountries))
        let viewModel = CountryListViewModel(service: mockService)

        await viewModel.loadCountries()

        #expect(viewModel.countries.count == 1)
        #expect(viewModel.countries.first?.name == "South Georgia")
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
        #expect(viewModel.errorMessage == "The operation couldn’t be completed. (TestError error 1.)")
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

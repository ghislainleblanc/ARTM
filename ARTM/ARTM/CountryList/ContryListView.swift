//
//  ContryListView.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel: CountryListViewModel

    init(service: CountryServiceProtocol) {
        _viewModel = StateObject(wrappedValue: CountryListViewModel(service: service))
    }

    var body: some View {
        NavigationStack {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                    }
                }
            }
            .navigationTitle("Countries")
            .task {
                await viewModel.loadCountries()
            }
        }
    }
}

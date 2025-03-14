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
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                List(viewModel.countries) { country in
                    NavigationLink(destination: CountryDetailView(country: country)) {
                        HStack {
                            AsyncImage(url: URL(string: country.flag)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                            } placeholder: {
                                ProgressView()
                            }

                            Spacer()
                            
                            Text(country.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Countries")
        .task {
            await viewModel.loadCountries()
        }
    }
}


//
//  FlagAsyncImage.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import SwiftUI

struct FlagAsyncImage: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Image(systemName: "flag.slash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    FlagAsyncImage(url: URL(string: "https://flagcdn.com/w320/ca.png"))
}

#Preview {
    FlagAsyncImage(url: URL(string: "https://foo.bar/ll.png"))
}

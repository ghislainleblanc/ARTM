//
//  Country.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

struct Country: Identifiable, Decodable, Sendable {
    let id: UUID
    let name: String
    let flag: String
    let continent: String
    let population: Int
    let capital: String

    private enum CodingKeys: String, CodingKey {
        case flags, name, capital, population, continents
    }

    private enum FlagKeys: String, CodingKey {
        case png
    }

    private enum NameKeys: String, CodingKey {
        case common
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()

        // Decode flag URL
        let flags = try container.nestedContainer(keyedBy: FlagKeys.self, forKey: .flags)
        flag = try flags.decode(String.self, forKey: .png)

        // Decode name
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .common)

        // Decode continent (first element in array)
        continent = try container.decode([String].self, forKey: .continents).first ?? "Unknown"

        // Decode population
        population = try container.decode(Int.self, forKey: .population)

        // Decode capital (first element in array)
        capital = try container.decode([String].self, forKey: .capital).first ?? "Unknown"
    }
}

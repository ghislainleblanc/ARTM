//
//  Country.swift
//  ARTM
//
//  Created by Ghislain Leblanc on 2025-03-14.
//

import Foundation

struct Country: Identifiable, Decodable {
    let id: UUID
    let name: String
    let flag: String
    let continent: String
    let population: Int
    let capital: String
}

//
//  PokemonListResponse.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation
struct PokemonListResponse: Decodable {
    struct PokemonListResult: Decodable {
        let url: String
        let name: String
    }
    let results: [PokemonListResult]
}

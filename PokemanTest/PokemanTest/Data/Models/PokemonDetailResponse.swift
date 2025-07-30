//
//  PokemonDetailResponse.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation
struct PokemonDetailResponse: Decodable {
    struct Sprites: Decodable {
        let front_default: String
    }
    let id: Int
    let name: String
    let height: Int
    let sprites: Sprites
}

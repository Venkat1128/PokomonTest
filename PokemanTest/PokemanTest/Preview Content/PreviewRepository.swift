//
//  PreviewRepository.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 30/07/2025.
//

import Foundation

struct PreviewRepository: PokemonRepository {
    func fetchPokemonList() async throws -> [Pokemon] {
        return [
            Pokemon(id: 1, name: "Bulbasaur", height: 7, imageUrl: ""),
            Pokemon(id: 2, name: "Charmander", height: 6, imageUrl: ""),
            Pokemon(id: 3, name: "Squirtle", height: 5, imageUrl: "")
        ]
    }

    func fetchPokemonDetails(name: String) async throws -> Pokemon {
        return Pokemon(id: 1, name: name, height: 7, imageUrl: "")
    }
}

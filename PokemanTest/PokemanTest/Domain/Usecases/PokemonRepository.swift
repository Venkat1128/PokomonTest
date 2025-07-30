//
//  PokemanRepository.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation

protocol PokemonRepository {
    func fetchPokemonList() async throws -> [Pokemon]
    func fetchPokemonDetails(name: String) async throws -> Pokemon
}

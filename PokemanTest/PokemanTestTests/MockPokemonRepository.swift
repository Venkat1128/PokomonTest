//
//  MockPokemonRepository.swift
//  PokemanTestTests
//
//  Created by Venkateswarlu Kurapati on 30/07/2025.
//

@testable import PokemanTest
class MockPokemonRepository: PokemonRepository {
    var mockPokemon = Pokemon(id: 1, name: "Bulbasaur", height: 7, imageUrl: "https://...")
    func fetchPokemonList() async throws -> [PokemanTest.Pokemon] {
        return [mockPokemon]
    }
    
    func fetchPokemonDetails(name: String) async throws -> PokemanTest.Pokemon {
        return mockPokemon
    }

}


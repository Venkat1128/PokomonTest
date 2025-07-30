//
//  PokemonRepositoryImplementation.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation
class PokemonRepositoryImplementation: PokemonRepository {
    private let apiService: PokemonAPIService
    
    init(apiService: PokemonAPIService) {
        self.apiService = apiService
    }
    
    func fetchPokemonList() async throws -> [Pokemon] {
        let response = try await apiService.fetchPokemonList()
        return response.enumerated().map {
            Pokemon(id: $0.offset + 1, name: $0.element.name.capitalized, height: 0, imageUrl: "")
        }
    }
    
    func fetchPokemonDetails(name: String) async throws -> Pokemon {
        let detailsResponse = try await apiService.fetchPokemonDetails(name: name)
        return Pokemon(
            id: detailsResponse.id,
            name:detailsResponse.name.capitalized,
            height: detailsResponse.height,
            imageUrl: detailsResponse.sprites.front_default
        )
    }
}

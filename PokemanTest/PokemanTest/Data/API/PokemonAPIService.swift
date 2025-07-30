//
//  PokemonAPIService.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation

class PokemonAPIService {

    private let baseURL = "https://pokeapi.co/api/v2/"
    func fetchPokemonList() async throws -> [PokemonListResponse.PokemonListResult] {
        let url = URL(string: "\(baseURL)/pokemon?Limit=50")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonListResponse.self, from: data).results
    }
    
    func fetchPokemonDetails(name: String) async throws -> PokemonDetailResponse {
        let url = URL(string: "\(baseURL)/pokemon/\(name.lowercased())")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
    }
}

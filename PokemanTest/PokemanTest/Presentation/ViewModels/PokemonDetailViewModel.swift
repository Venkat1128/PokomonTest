//
//  PokemonDetailViewModel.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemon: Pokemon?
    let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func loadPokemonDetails(name: String) {
        Task {
            do {
                pokemon = try await repository.fetchPokemonDetails(name: name)
            } catch {
                print("Error fetching pokemon details: \(error)")
            }
        }
    }
}

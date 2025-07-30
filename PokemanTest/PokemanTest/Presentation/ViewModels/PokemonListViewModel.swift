//
//  PokemonListViewModel.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = false
    let repository: PokemonRepository
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    func loadPokemons() {
        Task {
           isLoading = true
         defer { isLoading = false }
            
            do {
                pokemons = try await self.repository.fetchPokemonList()
                print(pokemons)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

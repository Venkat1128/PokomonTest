//
//  AppDIContainer.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import Foundation
struct AppDIContainer {
    let apiService = PokemonAPIService()
    var pokemonRepository: PokemonRepository {
        PokemonRepositoryImplementation(apiService: apiService)
    }
}

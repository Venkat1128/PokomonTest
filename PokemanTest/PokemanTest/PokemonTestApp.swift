//
//  PokemanTestApp.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import SwiftUI

@main
struct PokemonTestApp: App {
    let container = AppDIContainer()
    var body: some Scene {
        WindowGroup {
            PokemonListView(
                viewModel: PokemonListViewModel(repository: container.pokemonRepository)
            )
        }
    }
}

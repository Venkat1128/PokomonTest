//
//  PokemonListView.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                VStack {
                    ProgressView("Loading Pokémon...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                        .padding()
                    Text("Please wait while we fetch your Pokémon.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGroupedBackground))
                
            } else {
                List(viewModel.pokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailView(
                        pokemonName: pokemon.name,
                        viewModel: PokemonDetailViewModel(repository: viewModel.repository))
                    ) {
                        Text(pokemon.name)
                            .font(.headline)
                            .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Pokémon")
            }
        }
        .onAppear {
            viewModel.loadPokemons()
        }
    }
}


#Preview {
    PokemonListView(
        viewModel: PokemonListViewModel(repository: PreviewRepository())
    )
}



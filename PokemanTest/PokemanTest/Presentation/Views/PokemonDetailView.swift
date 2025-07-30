//
//  PokemonDetailView.swift
//  PokemanTest
//
//  Created by Venkateswarlu Kurapati on 29/07/2025.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemonName: String
    @ObservedObject var viewModel: PokemonDetailViewModel
    var body: some View {
        VStack(spacing: 16) {
            if let pokemon = viewModel.pokemon {
                VStack(spacing: 12){
                    Text(pokemon.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2)
                    
                    Text("Height: \(pokemon.height)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                )
                .padding()
                
            }
            else {
                ProgressView()
            }
        }
        .navigationTitle(pokemonName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadPokemonDetails(name: pokemonName)
        }
    }
}

#Preview {
    PokemonDetailView(
        pokemonName: "Bulbasaur",
        viewModel: PokemonDetailViewModel(repository: PreviewRepository())
    )
}

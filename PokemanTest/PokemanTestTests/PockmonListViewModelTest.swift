//
//  PockmonRepositoryTest.swift
//  PokemanTestTests
//
//  Created by Venkateswarlu Kurapati on 30/07/2025.
//

import XCTest
@testable import PokemanTest

@MainActor
final class PockmonListViewModelTest: XCTestCase {
    
    func testLoadPokemons_setsPokemonsAndLoadingState() {
        let mockRepo = MockPokemonRepository()
        let viewModel = PokemonListViewModel(repository: mockRepo)
        
        let expectation = XCTestExpectation(description: "Load Pokémons")
        viewModel.loadPokemons()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertEqual(viewModel.pokemons.count, 1)
            XCTAssertEqual(viewModel.pokemons.first?.name, "Bulbasaur")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

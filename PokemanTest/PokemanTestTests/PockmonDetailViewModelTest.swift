//
//  PockmonDetailViewModelTest.swift
//  PokemanTestTests
//
//  Created by Venkateswarlu Kurapati on 30/07/2025.
//

import XCTest
@testable import PokemanTest

final class PockmonDetailViewModelTest: XCTestCase {

    @MainActor
    func testLoadPokemonDetail_setsPokemon() {
        let mockRepo = MockPokemonRepository()
        let viewModel = PokemonDetailViewModel(repository: mockRepo)
        let expectation = XCTestExpectation(description: "Load Pokémon Detail")
        
        viewModel.loadPokemonDetails(name: "Bulbasaur")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertNotNil(viewModel.pokemon)
            XCTAssertEqual(viewModel.pokemon?.name, "Bulbasaur")
            XCTAssertEqual(viewModel.pokemon?.height, 7)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

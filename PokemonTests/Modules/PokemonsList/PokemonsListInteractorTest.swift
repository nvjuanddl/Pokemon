//
//  PokemonsListInteractorTest.swift
//  PokemonTests
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import XCTest
import Combine
@testable import Pokemon

final class PokemonsListInteractorTest: XCTestCase {
    
    private var networkerMock: NetworkerMock!
    private var sut: PokemonsListInteractorInterface!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        networkerMock = NetworkerMock()
        sut = PokemonsListInteractor(networker: networkerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        networkerMock = nil
        sut = nil
    }
    
    func testGetPokemonsListSuccess() {
        let expectation = self.expectation(description: "PokemonsList")
        networkerMock.canResponseSuccess = true
        networkerMock.data = "PokemonsList".loadJson()
        sut.loadPokemonsList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Unexpected completion: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { urls in
                XCTAssert(!urls.isEmpty)
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetPokemonsListFailed() {
        let expectation = self.expectation(description: "PokemonsList")
        networkerMock.canResponseSuccess = false
        sut.loadPokemonsList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTAssert(!error.localizedDescription.isEmpty)
                }
                expectation.fulfill()
            }, receiveValue: { urls in
                XCTFail("Unexpected completion: \(urls)")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetPokemonDetailSuccess() {
        let expectation = self.expectation(description: "PokemonDetail")
        networkerMock.canResponseSuccess = true
        networkerMock.data = "PokemonDetail".loadJson()
        sut.loadPokemonDetail(url: "https://pokeapi.co/api/v2/pokemon/1")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Unexpected completion: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { item in
                XCTAssert(item.id == 1)
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetPokemonDetailFailed() {
        let expectation = self.expectation(description: "PokemonDetail")
        networkerMock.canResponseSuccess = false
        sut.loadPokemonDetail(url: "https://pokeapi.co/api/v2/pokemon/1")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTAssert(!error.localizedDescription.isEmpty)
                }
                expectation.fulfill()
            }, receiveValue: { item in
                XCTFail("Unexpected completion: \(item)")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

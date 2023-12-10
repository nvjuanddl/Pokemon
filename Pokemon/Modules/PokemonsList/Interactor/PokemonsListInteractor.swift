//
//  PokemonsListInteractor.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Combine
import Foundation

final class PokemonsListInteractor: PokemonsListInteractorInterface {
    
    // MARK: - Private properties -
    
    private var networker: Networking
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Public properties -
    
    var nextURL: String?
    
    // MARK: - Lifecycle -
    
    init(networker: Networking) {
        self.networker = networker
    }
    
    // MARK: - Private methods -
    
    func loadPokemonDetail(url: String) -> AnyPublisher<PokemonDetailEntity, Error> {
        let request = PokemonsDetailRequest(url: url)
        return self.networker.fetch(request).eraseToAnyPublisher()
    }
    
    func loadPokemonDetailsList(urls: [String]) -> AnyPublisher<[PokemonDetailEntity], Error> {
        let publishers: [AnyPublisher<PokemonDetailEntity, Error>] = urls.map(loadPokemonDetail)
        return Publishers.MergeMany(publishers)
            .collect(publishers.count)
            .eraseToAnyPublisher()
    }
    
    func loadPokemonsList() -> AnyPublisher<[String], Error> {
        let request = PokemonsListRequest(url: nextURL)
        return networker.fetch(request).compactMap { list in
            self.nextURL = list.next
            return list.results.compactMap { $0.url }
        }.eraseToAnyPublisher()
    }
    
    func hasNext() -> Bool {
        return nextURL != nil
    }
    
    func getPokemonsList() -> AnyPublisher<[PokemonDetailEntity], Error> {
        loadPokemonsList()
            .flatMap(loadPokemonDetailsList)
            .eraseToAnyPublisher()
    }
}

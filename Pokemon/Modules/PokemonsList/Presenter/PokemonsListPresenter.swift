//
//  PokemonsListPresenter.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Foundation
import Combine

final class PokemonsListPresenter {

    // MARK: - Private properties -

    private let interactor: PokemonsListInteractorInterface
    private let wireframe: PokemonsListWireframeInterface
    private var allItems: [PokemonDetailEntity] = []
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public properties -
    
    @Published var items: [PokemonDetailEntity] = []
    var hasSearch: Bool = false

    // MARK: - Lifecycle -

    init(
        interactor: PokemonsListInteractorInterface,
        wireframe: PokemonsListWireframeInterface
    ) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.getPokemonsList()
    }
    
    // MARK: - Private methods -
    
    private func assign(_ items: [PokemonDetailEntity]) {
        if self.items.isEmpty {
            self.items = items
        } else {
            self.items.append(contentsOf: items)
        }
        self.allItems = self.items
    }
}

// MARK: - PokemonsListPresenterInterface -

extension PokemonsListPresenter: PokemonsListPresenterInterface {
    
    var last: PokemonDetailEntity? { items.last }
    
    func getPokemonsList() {
        interactor
            .getPokemonsList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    print(failure)
                }
            }, receiveValue: { [weak self] items in
                guard let self else { return }
                self.assign(items)
            })
            .store(in: &cancellables)
    }
    
    func hasNext() -> Bool {
        return items.isEmpty || interactor.hasNext()
    }
    
    func search(query: String) {
        hasSearch = !query.isEmpty
        guard !query.isEmpty else {
            items = allItems
            return
        }
        items = items.filter { item in
            let stringMatch = item.name.lowercased().ranges(of: query.lowercased())
            return !stringMatch.isEmpty ? true : false
        }
    }
    
    func goToPokemonDetail(item: PokemonDetailEntity) {
        wireframe.goToPokemonDetail(item: item)
    }
}

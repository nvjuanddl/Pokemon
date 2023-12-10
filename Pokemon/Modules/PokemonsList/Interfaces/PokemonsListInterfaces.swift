//
//  PokemonsListInterfaces.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Combine

protocol PokemonsListWireframeInterface: WireframeInterface {
    func goToPokemonDetail(item: PokemonDetailEntity)
}
protocol PokemonsListInteractorInterface: InteractorInterface { 
    func hasNext() -> Bool
    func getPokemonsList() -> AnyPublisher<[PokemonDetailEntity], Error>
    func loadPokemonsList() -> AnyPublisher<[String], Error>
    func loadPokemonDetail(url: String) -> AnyPublisher<PokemonDetailEntity, Error>
}

protocol PokemonsListPresenterInterface: ObservableObject {
    var items: [PokemonDetailEntity] { get }
    var last: PokemonDetailEntity? { get }
    var hasSearch: Bool { get }
    
    func getPokemonsList()
    func hasNext() -> Bool
    func search(query: String)
    func goToPokemonDetail(item: PokemonDetailEntity)
}

//
//  PokemonDetailAdapter.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import Foundation

protocol PokemonDetailAdapter {
    var identifier: String { get }
    var headline: String { get }
    var imageURL: URL? { get }
    var typesList: [(icon: String, name: String)]  { get }
    var movesList: String { get }
    var abilitiesList: String { get }
    var colorName: String? { get }
}

extension PokemonDetailEntity: PokemonDetailAdapter {
    
    var movesList: String { "\n • \(moves.compactMap { $0.type }.joined(separator: "\n • "))" }
    var abilitiesList: String { "\n • \(abilities.compactMap { $0.type }.joined(separator: "\n • "))" }
}


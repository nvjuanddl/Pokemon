//
//  GridCellAdapter.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import Foundation

protocol GridCellAdapter {
    var identifier: String { get }
    var headline: String { get }
    var imageURL: URL? { get }
    var typesList: [(icon: String, name: String)] { get }
    var colorName: String? { get }
}

extension PokemonDetailEntity: GridCellAdapter {
    
    var identifier: String { String(format: "%03d", id) }
    var headline: String { name.capitalized }
    var imageURL: URL? { url == nil ? nil : URL(string: url!) }
    var colorName: String? { types.first?.type }
    var typesList: [(icon: String, name: String)] { types.map { ("Type_Icon_\($0.type.capitalized)", $0.type.capitalized) } }
}

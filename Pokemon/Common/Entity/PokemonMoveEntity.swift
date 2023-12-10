//
//  PokemonMoveEntity.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import Foundation
import Combine

class PokemonMoveEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var type: String
    
    enum CodingKeys: CodingKey {
        case move
    }
    
    enum TypeCodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .move)
        type = try typeContainer.decode(String.self, forKey: .name)
    }
}

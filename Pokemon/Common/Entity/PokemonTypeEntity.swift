//
//  PokemonTypeEntity.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import Foundation
import Combine

class PokemonTypeEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var type: String
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    enum TypeCodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
        type = try typeContainer.decode(String.self, forKey: .name)
    }
}

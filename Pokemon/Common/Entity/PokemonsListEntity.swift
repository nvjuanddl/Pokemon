//
//  PokemonsListEntity.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Foundation
import Combine

class PokemonsListEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var results: [PokemonEntity]
    @Published var next: String?
    
    enum CodingKeys: CodingKey {
        case results
        case next
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([PokemonEntity].self, forKey: .results)
        next = try? container.decode(String.self, forKey: .next)
    }
}

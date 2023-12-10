//
//  PokemonEntity.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import Foundation
import Combine

class PokemonEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var name: String
    @Published var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}

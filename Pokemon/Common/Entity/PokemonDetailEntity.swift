//
//  PokemonDetailEntity.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Combine
import Foundation

//"other": {
//      "dream_world": {
//        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
//        "front_female": null
//      },
//      "home": {
//        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
//        "front_female": null,
//        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
//        "front_shiny_female": null
//      },
//      "official-artwork": {
//        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
//        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"
//      }
//    }

class PokemonDetailEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var name: String
    @Published var url: String?
    @Published var id: Int
    @Published var types: [PokemonTypeEntity]
    @Published var abilities: [PokemonAbilityEntity]
    @Published var moves: [PokemonMoveEntity]
    
    enum CodingKeys: CodingKey {
        case name
        case url
        case id
        case sprites
        case types
        case abilities
        case moves
    }
    
    enum SpritesCodingKeys: String, CodingKey {
        case other
    }
    
    enum OtherCodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
    
    enum ArtworkCodingKeys: String, CodingKey {
        case url = "front_default"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let spritesContainer = try container.nestedContainer(keyedBy: SpritesCodingKeys.self, forKey: .sprites)
        
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        types = try container.decode([PokemonTypeEntity].self, forKey: .types)
        abilities = try container.decode([PokemonAbilityEntity].self, forKey: .abilities)
        moves = try container.decode([PokemonMoveEntity].self, forKey: .moves)
        
        let otherContainer = try spritesContainer.nestedContainer(keyedBy: OtherCodingKeys.self, forKey: .other)
        let dreamWorldContainer = try otherContainer.nestedContainer(keyedBy: ArtworkCodingKeys.self, forKey: .officialArtwork)
        url = try? dreamWorldContainer.decode(String.self, forKey: .url)
    }
}

extension PokemonDetailEntity: Equatable {
    
    static func == (lhs: PokemonDetailEntity, rhs: PokemonDetailEntity) -> Bool {
        lhs.id == rhs.id
    }
}

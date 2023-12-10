//
//  PokemonsListRequest.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Foundation

struct PokemonsListRequest: Request {
    typealias Output = PokemonsListEntity
    
    var url: URL
    var method: HTTPMethod { .get }
    
    init(url: String?) {
        if let url {
            self.url = URL(string: url)!
        } else {
            self.url = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
        }
    }
}

//
//  PokemonsDetailRequest.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Foundation

struct PokemonsDetailRequest: Request {
    typealias Output = PokemonDetailEntity
    
    var url: URL
    var method: HTTPMethod { .get }
    
    init(url: String) {
        self.url = URL(string: url)!
    }
}

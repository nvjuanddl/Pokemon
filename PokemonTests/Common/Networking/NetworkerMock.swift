//
//  File.swift
//  PokemonTests
//
//  Created by Juan Delgado Lasso on 9/12/23.
//

import Foundation
import Combine
@testable import Pokemon

enum PokemonError: Error {
    case unowned
}

class NetworkerMock: Networking {
    
    var canResponseSuccess = true
    var data: Data?
    
    func fetch<R>(_ request: R) -> AnyPublisher<R.Output, Error> where R : Pokemon.Request {
        if canResponseSuccess, let data = self.data {
            do {
                return Just(try request.decode(data)).setFailureType(to: Error.self).eraseToAnyPublisher()
            } catch {
                return Fail<R.Output, Error>(error: error).eraseToAnyPublisher()
            }
        } else {
            return Fail<R.Output, Error>(error: PokemonError.unowned).eraseToAnyPublisher()
        }
    }
}

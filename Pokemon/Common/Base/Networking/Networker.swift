//
//  Networker.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import Foundation
import Combine

protocol Networking {
    func fetch<R: Request>(_ request: R) -> AnyPublisher<R.Output, Error>
}

class Networker: Networking {
    
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        URLCache.shared.diskCapacity = Int.max
        return URLSession(configuration: configuration)
    }()
    
    func fetch<R: Request>(_ request: R) -> AnyPublisher<R.Output, Error> {
        return session
            .dataTaskPublisher(for: request.urlRequest)
            .compactMap { $0.data }
            .tryMap(request.decode)
            .eraseToAnyPublisher()
    }
}

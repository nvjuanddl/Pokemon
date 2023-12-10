//
//  PokemonDetailPresenter.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import Foundation
import Combine

final class PokemonDetailPresenter: ObservableObject {
    
    // MARK: - Private properties -

    private let wireframe: PokemonDetailWireframeInterface

    // MARK: - Public properties -

    @Published var item: PokemonDetailAdapter

    // MARK: - Lifecycle -

    init(
        wireframe: PokemonDetailWireframeInterface,
        item: PokemonDetailEntity
    ) {
        self.wireframe = wireframe
        self.item = item
    }
    
    // MARK: - Public methods -
    
    func goBack() {
        wireframe.goBack()
    }
}

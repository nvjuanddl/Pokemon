//
//  PokemonDetailWireframe.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import UIKit

final class PokemonDetailWireframe: BaseWireframe<LazyHostingViewController<PokemonDetailView>> {

    // MARK: - Lifecycle -

    init(item: PokemonDetailEntity) {
        let moduleViewController = LazyHostingViewController<PokemonDetailView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = PokemonDetailPresenter(wireframe: self, item: item)
        moduleViewController.rootView = PokemonDetailView(presenter: presenter)
    }
}

// MARK: - PokemonDetailWireframeInterface -

extension PokemonDetailWireframe: PokemonDetailWireframeInterface { 
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

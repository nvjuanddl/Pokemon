//
//  PokemonsListWireframe.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import UIKit

final class PokemonsListWireframe: BaseWireframe<LazyHostingViewController<PokemonListView>> {

    // MARK: - Lifecycle -

    init() {
        let moduleViewController = LazyHostingViewController<PokemonListView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let interactor = PokemonsListInteractor(networker: Networker())
        let presenter = PokemonsListPresenter(interactor: interactor, wireframe: self)
        moduleViewController.rootView = PokemonListView(presenter: presenter)
    }

}

// MARK: - PokemonsListWireframeInterface -

extension PokemonsListWireframe: PokemonsListWireframeInterface {
    
    func goToPokemonDetail(item: PokemonDetailEntity) {
        let wireframe = PokemonDetailWireframe(item: item)
        navigationController?.pushWireframe(wireframe)
    }
}

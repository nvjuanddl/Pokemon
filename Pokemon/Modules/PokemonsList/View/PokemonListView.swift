//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var presenter: PokemonsListPresenter
    
    var body: some View {
        GridView(delegate: self) {
            ForEach(presenter.items, id: \.id) { item in
                GridCellView(element: item)
                    .task {
                        if item == self.presenter.last, hasNext(), !hasSearch {
                            presenter.getPokemonsList()
                        }
                    }
                    .onTapGesture {
                        presenter.goToPokemonDetail(item: item)
                    }
            }
        }
    }
}

extension PokemonListView: SearchDelegate {
    
    var placeHolder: String { return "Find your favorite" }
    
    func search(query: String) {
        presenter.search(query: query)
    }
}

extension PokemonListView: GridViewDelegate {
    
    var hasSearch: Bool {
        presenter.hasSearch
    }
    
    func more() {
        presenter.getPokemonsList()
    }
    
    func hasNext() -> Bool {
        return presenter.hasNext()
    }
}

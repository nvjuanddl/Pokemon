//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 7/12/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: PokemonDetailPresenter
    
    var body: some View {
        VStack {
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(Color.backgroundColor)
                  
            List {
                VStack {
                    HStack(spacing: 5) {
                        Text(presenter.item.headline)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: .zero, trailing: .zero))
                            .foregroundColor(.white)
                            .font(Font.system(size: 30, weight: .bold))
                        Spacer()
                        Text("#\(presenter.item.identifier)")
                            .padding(EdgeInsets(top: 10, leading: .zero, bottom: .zero, trailing: 10))
                            .foregroundColor(.white)
                            .font(Font.system(size: 30, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        ForEach(presenter.item.typesList, id:\.0) { item in
                            HStack {
                                Image(item.icon)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(item.name)
                                    .lineLimit(1)
                                    .font(Font.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 16)
                            }
                            .background(Color(item.name))
                            .cornerRadius(20)
                        }
                    }
                    
                    AsyncImage(url: presenter.item.imageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                        } else if phase.error != nil {
                            Image(systemName: Constants.defaultImageAlternative)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 120, alignment: .center)
                                .tint(.white)
                        } else {
                            ActivityIndicator(size: 45, color: .red)
                        }
                    }
                }
                .background(PokemonType(rawValue: presenter.item.colorName ?? .empty)?.color.opacity(0.6))
                .cornerRadius(10)
                
                Text("Abilities : \(presenter.item.abilitiesList)")
                
                Text("Moves : \(presenter.item.movesList)")
            }
            .listStyle(.plain)
        }
    }
}

//
//  GridCellView.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import SwiftUI

struct GridCellView: View {
    let element: GridCellAdapter
    @State var failImage = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(PokemonType(rawValue: element.colorName ?? .empty)?.color.opacity(0.6))
            VStack(spacing: 5) {
                HStack(spacing: 5) {
                    Text(element.headline)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: .zero, trailing: .zero))
                        .foregroundColor(.white)
                        .font(Font.system(size: 12, weight: .bold))
                    Spacer()
                    Text("#\(element.identifier)")
                        .padding(EdgeInsets(top: 10, leading: .zero, bottom: .zero, trailing: 10))
                        .foregroundColor(.white)
                        .font(Font.system(size: 12, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    VStack {
                        ForEach(element.typesList, id:\.0) { item in
                            HStack {
                                Image(item.icon)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(item.name)
                                    .lineLimit(1)
                                    .font(Font.system(size: 10))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Spacer()
                            }
                            .padding(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: 10))
                            .background(PokemonType(rawValue: element.colorName ?? .empty)?.color.opacity(0.6))
                            .cornerRadius(20)
                        }
                    }
                        
                    Spacer()
                    
                    AsyncImage(url: element.imageURL) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60, alignment: .trailing)
                                .clipped()
                        } else if phase.error != nil {
                            Image(systemName: Constants.defaultImageAlternative)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .tint(.white)
                        } else {
                            ActivityIndicator(size: 45, color: .red).padding()
                        }
                    }
                }
                .padding(EdgeInsets(top: .zero, leading: 10, bottom: 10, trailing: 10))
            }
            .cornerRadius(10)
        }
    }
}

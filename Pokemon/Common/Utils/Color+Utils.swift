//
//  Color+Utils.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import SwiftUI

extension Color {
    
    static let backgroundColor = Color(red: 0.1, green: 0.1, blue: 0.2)
    static let lightbackgroundColor =  Color(red: 0.2, green: 0.2, blue: 0.3)
}

enum PokemonType: String {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var color: Color {
        switch self {
        case .bug:
            Color(red: 0.565, green: 0.757, blue: 0.173)
        case .dark:
            Color(red: 0.353, green: 0.325, blue: 0.400)
        case .dragon:
            Color(red: 0.039, green: 0.427, blue: 0.769)
        case .electric:
            Color(red: 0.957, green: 0.824, blue: 0.231)
        case .fairy:
            Color(red: 0.925, green: 0.561, blue: 0.902)
        case .fighting:
            Color(red: 0.808, green: 0.251, blue: 0.412)
        case .fire:
            Color(red: 1.000, green: 0.612, blue: 0.329)
        case .flying:
            Color(red: 0.576, green: 0.667, blue: 0.871)
        case .ghost:
            Color(red: 0.325, green: 0.412, blue: 0.675)
        case .grass:
            Color(red: 0.388, green: 0.733, blue: 0.357)
        case .ground:
            Color(red: 0.851, green: 0.467, blue: 0.275)
        case .ice:
            Color(red: 0.455, green: 0.808, blue: 0.753)
        case .normal:
            Color(red: 0.565, green: 0.600, blue: 0.631)
        case .poison:
            Color(red: 0.671, green: 0.416, blue: 0.784)
        case .psychic:
            Color(red: 0.976, green: 0.443, blue: 0.467)
        case .rock:
            Color(red: 0.780, green: 0.718, blue: 0.545)
        case .steel:
            Color(red: 0.353, green: 0.557, blue: 0.631)
        case .water:
            Color(red: 0.298, green: 0.565, blue: 0.831)
        }
    }
}

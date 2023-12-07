//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 6/12/23.
//

import SwiftUI

@main
struct PokemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

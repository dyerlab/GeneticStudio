//
//  Genetic_StudioApp.swift
//  Shared
//
//  Created by Rodney Dyer on 12/24/21.
//

import SwiftUI

@main
struct Genetic_StudioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

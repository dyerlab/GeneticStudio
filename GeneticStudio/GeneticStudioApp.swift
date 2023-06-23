//
//  GeneticStudioApp.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI

@main
struct GeneticStudioApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Defaults.document ) { file in
            ContentView(document: file.$document)
        }
    }
}

//
//  GeneticStudioApp.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI

@main
struct GeneticStudioApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: GeneticStudioDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

//
//  GeneticStudioApp.swift
//  Shared
//
//  Created by Rodney Dyer on 12/29/21.
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

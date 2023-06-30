//
//  Defaults.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import DLGenetic
import Foundation

struct Defaults {
    
    static var geneticStudioDocument: GeneticStudioDocument {
        var doc = GeneticStudioDocument(species: "Araptus attenuatus")
        doc.dataStore = DataStore.Default()
        return doc
    }
}

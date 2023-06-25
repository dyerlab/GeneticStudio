//
//  Defaults.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import Foundation
import DLGenetic

struct Defaults {
    
    static var document: GeneticStudioDocument {
        var doc = GeneticStudioDocument(notes: "These are the default notes.")
        doc.dataSet = DataStore.Default()
        return doc
    }
}

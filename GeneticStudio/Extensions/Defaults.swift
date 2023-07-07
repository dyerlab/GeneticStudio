//
//  Defaults.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import DLMatrix
import DLGenetic
import Foundation

struct Defaults {
    
    static var geneticStudioDocument: GeneticStudioDocument {
        var doc = GeneticStudioDocument(species: "Araptus attenuatus")
        doc.dataStore = DataStore.Default()
        return doc
    }
    
    static var alleleFrequencyMatrix: Matrix {
        let freqs = DataStore.Default().frequencyForStrataLevels(locus: "LTRS", strata: "Region")
        return Matrix.forFrequencies( freqs: freqs )
    }
    
    static var allelicDiversityMatrix: Matrix {
        let divs = DataStore.Default().diversityForAllLoci()
        return Matrix.forAllelicDiversity(divs: divs )
    }
    
    static var genotypicDiversityMatrix: Matrix {
        let divs = DataStore.Default().diversityForAllLoci()
        return Matrix.forGenotypicDiversity(divs: divs )
    }
    
}

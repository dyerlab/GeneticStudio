//
//  Locus.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


/**
 Class for a collection of loci.
 
 This is primarily used as a marshalling class for serialization of a locus
    object into a database.  Storing individual genotypes by locus rather
    than loci by indiviudal allows us to parse large genomic datasets and
    deposit them into a database.  Subsequent analysis could select the
    subset of loci who meet specific criteria by selecting rows (instances)
    that satisfy conditions (e.g., contig location, Fst, allele frequencies,
    etd.) rather than loading up hundreds of thousands of locus objects.
 */
final class Locus {
    
    /// Container array for genotype objects
    var genotypes: [Genotype]
    
    /// A meta-data container to stash locus specific data (e.g., rs#, position, etc.)
    var meta: [String:String]
    
    /**
     Default initializer for object.
     
     - Returns:
        - A fully formed `Locus` object.
     */
    init() {
        self.genotypes = [Genotype]()
        self.meta = [String:String]()
    }
}


// MARK: Codable
extension Locus: Codable {}


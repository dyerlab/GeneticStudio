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
    etc.) rather than loading up hundreds of thousands of locus objects.
 */
public final class Locus {

    /// Container array for genotype objects
    private var genotypes: [Genotype]

    /// A meta-data container to stash locus specific data (e.g., rs#, position, etc.)
    var meta: [String: String]

    /// Convience function for the number of Genotype objects in the locus
    var count: Int { return genotypes.count }

    /// Embedded `Frequencies` object
    var frequencies: Frequencies

    /**
    Overload for subscript operator that removes does a switch with the
     `Frequencies` object for setting.  For appending use the append() function.
     
     - Parameters:
        - index: The index for the genotype to get or set.
     
     - Returns:
        - The value
    */
    subscript(index: Int) -> Genotype {
        get {
            return self.genotypes[index]
        }
        set(newValue) {
            self.frequencies.remove(geno: genotypes[index])
            self.frequencies.add(geno: newValue)
            self.genotypes[index] = newValue
        }
    }

    /**
     Default initializer for object.
     
     - Returns:
        - A fully formed `Locus` object.
     */
    init() {
        self.genotypes = [Genotype]()
        self.meta = [String: String]()
        self.frequencies = Frequencies()
    }

    /**
     Adding loci sequentially to cycle through the embedded `Frequencies` object.
     
     - Parameters:
        - geno: A `Genotype` object
     */
    func append(geno: Genotype ) {
        self.frequencies.add(geno: geno)
        self.genotypes.append(geno)
    }
}

// MARK: Codable
extension Locus: Codable {}

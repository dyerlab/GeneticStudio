//
//  Individual.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Class for maintaining information on an individual including
    strata, loci, and coordinates.
 */
public final class Individual {

    /// Dictionary of strata
    var strata: [String: String]

    /// Dictionary of `Genotype` objects sampled from this individual
    var locus: [String: Genotype]

    /// The spatial location of this individual.
    var location: Coordinate?

    /// Default constructor for the class.
    init() {
        self.strata = [String: String]()
        self.locus = [String: Genotype]()
    }
}

// MARK: -

/// Codable
extension Individual: Codable {}

/// Equatable
extension Individual: Equatable {

    /**
     Static function to determine equality of two individual objecs.
     
     - Parameters:
     - lhs: The `Individual` on the left of the operator
     - rhs: The `Individual` on the right of the operator
     
     - Returns: Bool indicating equality of strata, genotypes, and location.
     */
    public static func == (lhs: Individual, rhs: Individual) -> Bool {
        return lhs.strata == rhs.strata &&
            lhs.locus == rhs.locus &&
            lhs.location == rhs.location
    }
}


/// Custom String Convertible
extension Individual: CustomStringConvertible {
    
    public var description: String {
        var ret = [String]()
        let keys = self.strata.keys.sorted()
        for key in keys {
            ret.append( "\(strata[key] ?? "" )" )
        }
        if let coord = self.location {
            ret.append( "\(coord.latitude)")
            ret.append( "\(coord.longitude)")
        }
        let locusNames = self.locus.keys.sorted()
        for loc in locusNames {
            ret.append( "\(self.locus[loc]!)")
        }
        
        
        return ret.joined(separator: " ")
    }
    
}

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

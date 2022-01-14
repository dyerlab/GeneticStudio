//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GeneticStudio
//  AMOVADistance.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation


/**
 Estimation of multilocus genetic distances between two individuals
 - Parameters:
    - ind1: The first ``Individual``
    - ind2: The second ``Individual``
 - Returns: A `Double` estimating the additive distance between the two individuals.
 */
public func AMOVADistance( ind1: Individual, ind2: Individual) -> Double {
    var dist: Double = 0.0
    
    for locus in Array(ind1.loci.keys) {
        
        if let lhs = ind1.loci[locus],
           let rhs = ind2.loci[locus] {
            dist += AMOVADistance(loc1: lhs, loc2: rhs)
        }
    }
    
    return dist
}


/**
 Single locus AMOVA distance estimation. Returns 0 for missing or empty data by default (does not estimate median genotype).
 - Parameters:
    - loc1: The first ``Locus``
    - loc2: The second ``Locus``
 - Returns: A double retpresenting
 */
public func AMOVADistance( loc1: Locus, loc2: Locus) -> Double {
    
    if loc1.isEmpty || loc2.isEmpty || loc1 == loc2 {
        return 0.0 
    }
    var allAlleles = loc1.alleles
    allAlleles.append(contentsOf: loc2.alleles )
    let allelesToSet: [String] = Set<String>( allAlleles ).unique()
    
    let x = loc1.asVector(alleles: allelesToSet )
    let y = loc2.asVector(alleles: allelesToSet )
    return ((x - y).map { $0 * $0 }).sum / 2.0
}


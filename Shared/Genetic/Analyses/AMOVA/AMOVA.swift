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
//  AMOVA.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation



/**
 The main class that performs an analysis of molecular variance (AMOVA)
 */
class AMOVA  {
    
    /// The raw Covariance matrix
    var C: Matrix
    
    /// For all subsets in the dataset, here are the idempotent design matrices
    var H: [String : Matrix] = [:]
    
    
    init( data: Stratum ) {
        let individuals = data.individuals
        let N = individuals.count
        
        
        // Set up the covariance matrices
        let D = Matrix(N,N,0.0)
        for i in 0 ..< N {
            for j in (i+1) ..< N {
                let dist = AMOVADistance(ind1: individuals[i], ind2: individuals[j] )
                D[i,j] = dist
                D[j,i] = dist
            }
        }
        self.C = D.asCovariance
        
        
        // Set up the partitions
        for level in data.nestedLevels {
            let labels = data.stratumIdentifierForIndividuals(targetLevel: level )
            H[level] = Matrix.IdempotentHatMatrix( strata: labels )
        }
    }
    
}

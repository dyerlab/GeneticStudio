//
//  DataSet.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

final class DataSet {
    var individuals: [Individual]
    var frequencies: [String:Frequencies]
    var count : Int {
        return individuals.count
    }
    
    init(){
        self.individuals = [Individual]()
        self.frequencies = [String:Frequencies]()
    }
    
    
    
    
    func append(individual: Individual ) {
        for locus in individual.locus.keys {
            if !frequencies.keys.contains(locus) {
                frequencies[locus] = Frequencies()
            }
            frequencies[locus]!.add(geno: individual.locus[locus]! )
        }
        self.individuals.append( individual )
    }
    
    
    func subset(key: String, value: String) -> DataSet {
        let ret = DataSet()
        let inds = individuals.filter {$0.strata[key] == value}
        
        for ind in inds {
            ret.append(individual: ind)
        }
        return ret
    }
    
}

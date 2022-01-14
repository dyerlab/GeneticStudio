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
//  AlleleFrequencies.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/**
 Main class for Allele Frequencies for a single locus
 */
public class AlleleFrequencies {
    
    private var counts = [String:Double]()
    private var n = 0.0
    
    var numHets = 0.0
    var numDiploid = 0.0
    
    public var frequencies: [Double] {
        return frequenciesFor(alleles: self.alleles)
    }
    
    public var alleles: [String] {
        get {
            return counts.keys.sorted {$0.localizedStandardCompare($1) == .orderedAscending}
        }
        set {
            for toAdd in Set(newValue).subtracting( counts.keys ) {
                counts[toAdd] = 0.0
            }
        }

    }
    
    public init() {}
    
    public init( loci: [Locus] ) {
        for locus in loci {
            self.addLocus(loc: locus )
        }
    }
    
    
    public func addLocus( loc: Locus ) {
        
        if loc.ploidy > 1 {
            numDiploid += 1.0
            if loc.isHeterozygote {
                numHets += 1.0
            }
        }
        
        for allele in loc.alleles {
            if !allele.isEmpty {
                n += 1.0
                counts[allele, default: 0.0] += 1.0
            }
        }
    }
    
    public func frequency( allele: String) -> Double {
        if n == 0.0 {
            return 0.0
        } else {
            return counts[allele, default: 0.0] / n
        }
    }
    
    public func frequenciesFor( alleles: [String] ) -> [Double] {
        var ret = [Double]()
        
        for allele in alleles {
            ret.append( frequency(allele: allele ))
        }
        return ret
    }
    
}




extension AlleleFrequencies: CustomStringConvertible {
    
    public var description: String {
        var ret = "Frequencies:\n"
        for allele in self.alleles.sorted() {
            ret += String("\(allele): \(frequency(allele: allele)) \n")
        }
        return ret
    }
}



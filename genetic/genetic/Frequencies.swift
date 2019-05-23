//
//  Frequencies.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

final class Frequencies {
    var counts = [String:Double]()
    private var numAlleles: Double = 0.0
    private var numDiploid: Double = 0.0
    private var numHeterozygote: Double = 0.0
    
    var alleles: [String] {
        get {
            return self.counts.keys.sorted()
        }
    }
    
    var observed_heterozygosity: Double {
        get {
            return numHeterozygote / ( numDiploid > 0.0 ? numDiploid : 1.0)
        }
    }
    
    var expected_heterozygosity: Double {
        get {
            return numAlleles > 0.0 ? 1.0 - self.frequency(alleles: self.alleles).map {$0*$0}.reduce( 0.0, + ) : 0.0
        }
    }
    
    
    func add( geno: Genotype ) {
        
        if geno.ploidy != .missing {
            for allele in geno.alleles {
                self.numAlleles += 1.0
                self.counts[allele] = self.counts[allele, default: 0.0] + 1.0
            }
            
            if geno.ploidy > Ploidy.haploid {
                self.numDiploid += 1.0
                if geno.is_heterozygote {
                    self.numHeterozygote += 1.0
                }
            }
        }
    }
    
    func frequency(allele: String ) -> Double {
        if counts.keys.contains(allele) {
            return counts[allele]! / numAlleles
        }
        return 0.0
    }
    
    func frequency(alleles: [String]) -> [Double] {
        var ret = [Double]()
        for allele in alleles {
            ret.append( self.frequency(allele: allele))
        }
        return ret
    }
    
    
    
    
    
}


extension Frequencies: Codable {}

extension Frequencies: CustomStringConvertible {
    var description: String {
        var ret = ["Allele Frequencies:"]
        for allele in self.counts.keys.sorted() {
            ret.append( String("\(allele): \(self.frequency(allele: allele))"))
        }
        return ret.joined(separator: "\n")
    }
}

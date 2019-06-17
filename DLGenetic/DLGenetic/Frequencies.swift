//
//  Frequencies.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Class to maintain stats related to allele and genotype frequencies.
 
 Add and remove genotypes from this through the add() and remove()
 functions to maintain internal consistencey.
 */
public final class Frequencies {
    
    /// How many alleles observed in this frequency object
    var count: Int {
        return self.counts.keys.count
    }

    /// Dictionary for maintaing allele counts
    private var counts = [String: Double]()

    /// Total number of alleles recorded in counts
    private var numAlleles: Double = 0.0

    /// Number of Diploid or greater `Genotype` objects
    private var numDiploid: Double = 0.0

    /// Number of Diploid `Genotype` objects that were heterozygotes
    private var numHeterozygote: Double = 0.0

    /// Access for set of alleles recorded.
    var alleles: [String] {
        return self.counts.keys.sorted()
    }

    /// Fraction of diploid `Genotype` objects that were heterozygote.
    var observedHeterozygosity: Double {
        return numHeterozygote / ( numDiploid > 0.0 ? numDiploid : 1.0)
    }

    /// Expected fraction of `Genotype` objects given Hardy-Weinberg Equilibrium.
    var expectedHeterozygosity: Double {
        return numAlleles > 0.0 ? 1.0 - self.frequency(alleles: self.alleles).map {$0*$0}.reduce( 0.0, + ) : 0.0
    }

    /**
     Default function to add a `Genotype` to the class.
     
     - Parameters:
     - geno: The `Genotype` to add
     */
    func add( geno: Genotype ) {

        for allele in geno.alleles {
            self.numAlleles += 1.0
            self.counts[allele] = self.counts[allele, default: 0.0] + 1.0
        }

        if geno.ploidy > Ploidy.haploid {
            self.numDiploid +=  1.0

            if geno.isHeterozygote {
                self.numHeterozygote += 1.0
            }
        }

    }

    /**
     Default function to remove a `Genotype` from the frequeny object.
     
     - Parameters:
     - geno: The `Genotype` object to remove.
     */
    func remove( geno: Genotype ) {

        for allele in geno.alleles {
            self.numAlleles -= 1.0
            self.counts[allele] = self.counts[allele]! - 1.0
        }

        if geno.ploidy > Ploidy.haploid {
            self.numDiploid -= 1.0

            if geno.isHeterozygote {
                self.numHeterozygote -= 1.0
            }
        }

        let empty = counts.filter { _, value in
            return value < 1.0
        }
        empty.forEach { counts.removeValue(forKey: $0.key) }

    }

    /**
     Grab allele frequencies for specific allele.
     
     - Parameters:
     - allele: The allele to inquire about.
     
     - Returns: The frequency of the allele (or 0.0 if not here)
     */
    func frequency(allele: String ) -> Double {
        if counts.keys.contains(allele) {
            return counts[allele]! / numAlleles
        }
        return 0.0
    }

    /**
     Grab frequencies for a set of alleles.
     
     - Parameters:
     - alleles: An array of alleles to inquire about.
     
     - Returns: A 
     */
    func frequency(alleles: [String]) -> [Double] {
        var ret = [Double]()
        for allele in alleles {
            ret.append( self.frequency(allele: allele))
        }
        return ret
    }
    
    
    
    /// Get the Allelic Richness
    ///
    /// This function takes one of the `GeneticDiversityType` enums and returns
    ///  the result for this allele frequency object.  Possible modes include:
    ///   - A: The number of alleles
    ///   - A95: The number of alleles with frequency > 0.05
    ///   - Ae: A frequency weighed allelic richness
    ///   - Ho: Observed heterozygosity
    ///   - He: Exepcted heterozygosity (assuming HWE).
    ///
    ///   - Parameter mode: One of the `GeneticDiversityType` values.
    ///
    /// - Returns: The diversity estimate requested.
    func diversity( mode: GeneticDiversityType ) -> Double {
        
        switch mode {
            
        case .A:
            return Double( self.counts.keys.count )
            
        case .A95:
            let freqs = self.frequency(alleles: self.alleles )
            return Double( freqs.filter{ $0 >= 0.05}.count )
            
        case .Ae:
            let freqs = self.frequency(alleles: self.alleles )
            return 1.0 / (freqs.map {$0 * $0}.reduce(0, +))
            
        case .Ho:
            return self.observedHeterozygosity
            
        case .He:
            return self.expectedHeterozygosity
            
        }
        
    }

}

// MARK: -

// MARK: Codable
extension Frequencies: Codable {}

// MARK: CustomStringConvertible
extension Frequencies: CustomStringConvertible {

    /// Override description object to convert to string.
    public var description: String {
        var ret = ["Allele Frequencies:"]
        for allele in self.counts.keys.sorted() {
            ret.append( String("\(allele): \(self.frequency(allele: allele))"))
        }
        return ret.joined(separator: "\n")
    }
}




extension Frequencies: MatrixAdaptable {
    
    func asMatrix() -> Matrix {
        let alleles = self.alleles.sorted()
        let nrow = alleles.count
        var ret = Matrix(rows: nrow, cols: 1)
        ret.rowNames = alleles
        
        for (i,allele) in alleles.enumerated() {
            ret[i,0] = frequency(allele: allele)
        }
        
        return ret
    }
    
}

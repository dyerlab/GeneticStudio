//
//  File.swift
//  
//
//  Created by Rodney Dyer on 1/10/22.
//

import Foundation


/// A ViewModel for Allele Frequency Materials
public class FrequencyViewModel {
    
    /// The name of the locus
    public var locus: String
    
    /// The allele frequency components
    public var parameters: [String: AlleleFrequencies] = [:]
    
    /// Get all alleles
    public var allAlleles: [String] {
        var ret = [String]()
            
        for (_,freq) in self.parameters {
            ret.append(contentsOf: freq.alleles)
        }
        return ret.unique().sorted()
    }
    
    /// The initializer
    public init( stratum: Stratum, level: String, locus: String ) {
        self.locus = locus
        for strata in stratum.substrataAtLevel( named: level ) {
            if let site = stratum.substratum(named: strata ) {
                let loci = site.individuals.compactMap { $0.loci[locus] }
                parameters[ strata ] = AlleleFrequencies(loci: loci )
            }
        }
        
        // make sure everyon has the same alleles (all of them)
        for (_,freq) in parameters {
            freq.alleles = allAlleles
        }
    }
    
}


// MARK: - MatrixConvertible
extension FrequencyViewModel: MatrixConvertible {
    
    public func asMatrix() -> Matrix {
        let alleles = self.allAlleles
        let K = alleles.count
        
        let levels = self.parameters.keys.sorted()
        let N = levels.count
        
        let ret = Matrix(N, K, 0.0)
        
        for r in 0 ..< N {
            let freq = parameters[ levels[r], default: AlleleFrequencies() ]
            for c in 0 ..< K {
                let allele = alleles[c]
                ret[r,c] = freq.frequency(allele: allele )
            }
        }
        ret.colNames = alleles
        ret.rowNames = levels
        
        return ret
    }
    
}



// MARK: - Default Stuff
extension FrequencyViewModel {
    
    public static func DefaultFrequencyViewModel() -> FrequencyViewModel {
        return FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                  level: "Region",
                                  locus: "MP20")
    }
}

//
//  DiversityType.swift
//  PopgenKit
//
//  Created by Rodney Dyer.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


/// Enumeration across different kinds of genetic diversity to be estimated.
enum GeneticDiversityType: String, CaseIterable {
    
    /// The raw number of alleles at a locus
    case A
    /// The number of alleles with a frequency of at least 5%
    case A95
    /// The frequency scaled allelic diversity
    case Ae
    /// Observed heterozygosity
    case Ho
    /// Expected heterozygosity
    case He
    
    /// Allow inspection of the number of elements
    static var count: Int { return GeneticDiversityType.AllCases().count }
}

//
//  Genotype.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Enum summarizing the number of alleles at an instance.
 
 Levels include:
 - `missing`: No data at instance.
 - `haploid`: Only 1 allele, could be haploid or due to reduction (e.g., minus-mom).
 - `diploid`: Two alleles, independent of identity.
 - `polyploid`: More than 2 alleles.
 */
public enum Ploidy: Int, CaseIterable, Comparable {

    /// Empty instance with no alleles present at the locus.
    case missing

    /// Only one allele present at the locus.
    case haploid

    /// Two alleles present at the locus.
    case diploid

    /// Three alleles present at the locus.
    case polyploid

    /// Allows comparison of magnitude of Ploidy levels.
    public static func < (lhs: Ploidy, rhs: Ploidy) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

/// Fundamental class for a genotype, independent of ploidy or type.
public final class Genotype {

    /// The storage type for all alleles
    var alleles: [String]

    /// Ploidy represents the current number of alleles at an instance.
    var ploidy: Ploidy {
        switch alleles.count {
        case 0:
            return .missing
        case 1:
            return .haploid
        case 2:
            return .diploid
        default:
            return .polyploid
        }
    }

    /// Heterozygosity based upon having more than one unique type of allele
    var isHeterozygote: Bool {
        return Set(self.alleles).count > 1
    }

    /**
    Default initializer with no allocation of alleles.
 
    - Returns:
        - A new instance of Genotype
    */
    init() {
        self.alleles = [String]()
    }

    /**
     Initializer for separate alleles.
     
     - Parameters:
        - left: The first allele.
        - right: The second allele.
        - phased: A flag indicating that the order (left/right) is based upon gametic phase.
     - Returns:
        - A new instance of Genotype
     */
    init(left: String, right: String, phased: Bool = false ) {
        self.alleles = [left, right]
        if !phased {
            self.alleles.sort()
        }
    }

    /**
     Initializer for array of alleles.  These are not sorted.
     
     - Parameters:
        - alleles: An array of string objects
     - Returns:
        - A new instance of Genotype
     */
    init(alleles: [String]) {
        self.alleles = alleles
    }
}

// MARK: CustomStringConvertible
extension Genotype: CustomStringConvertible {
    public var description: String {
        return self.alleles.joined(separator: ":")
    }
}

// MARK: Equatable
extension Genotype: Equatable {
    public static func == (lhs: Genotype, rhs: Genotype) -> Bool {
        return lhs.alleles == rhs.alleles
    }
}

// MARK: Codable
extension Genotype: Codable {}

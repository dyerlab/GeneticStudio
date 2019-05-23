//
//  Genotype.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


enum Ploidy: Int, CaseIterable, Comparable {
    static func < (lhs: Ploidy, rhs: Ploidy) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case missing, haploid, diploid, polyploid
}


final class Genotype {
    var alleles: [String]
    
    var ploidy: Ploidy {
        get {
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
    }

    var is_heterozygote: Bool {
        get {
            return Set(self.alleles).count > 1
            
        }
        
    }
    
    init() {
        self.alleles = Array<String>()
    }
    
    init(left: String, right: String, phased: Bool = false ) {
        self.alleles = [left,right]
        if !phased {
            self.alleles.sort()
        }
    }
    
    init(alleles: [String]) {
        self.alleles = alleles
    }
}


extension Genotype: CustomStringConvertible {
    var description: String {
        return self.alleles.joined(separator: ":")
    }
}


extension Genotype: Equatable {
    static func == (lhs: Genotype, rhs: Genotype) -> Bool {
        return lhs.alleles == rhs.alleles
    }
}


extension Genotype: Codable {}

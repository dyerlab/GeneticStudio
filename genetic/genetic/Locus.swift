//
//  Locus.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

final class Locus {
    var genotypes: [Genotype]
    var meta: [String:String]
    var count: Int {
        get { return self.genotypes.count }
    }
    
    init() {
        self.genotypes = [Genotype]()
        self.meta = [String:String]()
    }
}


extension Locus: Codable {}


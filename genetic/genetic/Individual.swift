//
//  Individual.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

final class Individual {
    var strata: [String:String]
    var locus: [String:Genotype]
    var location: Coordinate?
    
    init() {
        self.strata = [String:String]()
        self.locus = [String:Genotype]()
    }
}

extension Individual: Codable {}

extension Individual: Equatable {
    static func == (lhs: Individual, rhs: Individual) -> Bool {
        return lhs.strata == rhs.strata &&
            lhs.locus == rhs.locus &&
            lhs.location == rhs.location
    }
}

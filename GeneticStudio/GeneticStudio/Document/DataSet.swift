//
//  DataSet.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import DLGenetic
import DLPopgraph

final public class DataSet {
    
    public var population: Population
    public var popgraph: Popgraph
    
    
    init() {
        population = Population()
        popgraph = Popgraph()
    }
    
    
}



extension DataSet: Codable {}


//
//  NodeSelectable.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 6/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

protocol NodeSelectable {
    var selected: Bool { get set }
    
    func toggleSelection()
}


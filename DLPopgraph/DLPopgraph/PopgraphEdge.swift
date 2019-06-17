//
//  PopgraphEdge.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation


class PopgraphEdge {
    
    var weight: Double
    var neighbors: (PopgraphNode,PopgraphNode)
    
    init(from: PopgraphNode, to: PopgraphNode, weight: Double) {
        self.neighbors = (from,to)
        self.weight = weight
        
        from.edges.append(self)
        to.edges.append(self)
    }
    
    func connects(from: String, to: String ) -> Bool {
        return neighbors.0.label == from && neighbors.1.label == to ||
                neighbors.0.label == to && neighbors.1.label == from
    }
    
    
    func connectedTo(source: PopgraphNode ) -> PopgraphNode {
        return neighbors.0 == source ? neighbors.1 : neighbors.0
    }
}



extension PopgraphEdge: Equatable {
    static func == (lhs: PopgraphEdge, rhs: PopgraphEdge) -> Bool {
        return lhs.weight == rhs.weight && lhs.neighbors == rhs.neighbors
    }
}

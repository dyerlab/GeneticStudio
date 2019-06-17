//
//  PopgraphNode.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation

class PopgraphNode {
    var size: Double
    var label: String
    var edges: [PopgraphEdge]
    var selected: Bool 
    
    init(label: String, size: Double ) {
        self.size = size
        self.label = label
        self.edges = [PopgraphEdge]()
        self.selected = false
    }
}






extension PopgraphNode: Equatable {
    static func == (lhs: PopgraphNode, rhs: PopgraphNode) -> Bool {
        return lhs.size == rhs.size &&
                lhs.label == rhs.label &&
                lhs.edges == rhs.edges
    }
}



extension PopgraphNode: CustomStringConvertible {
    
    var description: String {
        var ret = "Node: \(self.label) sz=\(self.size)\n"
        for edge in self.edges {
            let other = edge.connectedTo(source: self)
            ret += " - \(other.label) wt=\(edge.weight)\n"
        }
        return ret
    }
    
}

//
//  Popgraph.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation


class Popgraph {
    var nodes = [PopgraphNode]()
    var edges = [PopgraphEdge]()
    
    func addNode( label: String, size: Double ) {
        self.nodes.append( PopgraphNode(label: label, size: size) )
    }
    
    func addEdge( from: String, to: String, weight: Double ) {
        if let n1 = getNode(label: from), let n2 = getNode(label: to) {
            self.edges.append( PopgraphEdge(from: n1, to: n2, weight: weight))
        }
    }
    
    func getNode( label: String ) -> PopgraphNode? {
        return self.nodes.filter{$0.label == label}.first
    }
    
    func getEdge( from: String, to: String ) -> PopgraphEdge? {
        return self.edges.filter{ $0.connects(from: from, to: to)}.first
    }
    
}




extension Popgraph: MatrixAdaptable {
    
    func asMatrix() -> Matrix {
        let nodeLabels = self.nodes.map{ $0.label }
        var ret = Matrix(rows: nodeLabels.count, cols: nodeLabels.count)
        
        for e in self.edges {
            if let ridx = nodeLabels.firstIndex(of: e.neighbors.0.label),
                let cidx = nodeLabels.firstIndex(of: e.neighbors.1.label) {
                ret[cidx,ridx] = e.weight
                ret[ridx,cidx] = e.weight
            }
        }
        return ret
    }
    
}

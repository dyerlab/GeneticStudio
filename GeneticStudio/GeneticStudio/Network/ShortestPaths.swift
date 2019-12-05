//
//  ShortestPath.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation
import DLabKit


/// This does the whole, all-pairs paths.
///
/// - Parameter G: An instance of a `Popgraph`.
///
/// - Returns: A Matrix of all pairs shortest distance.  Unaccessable nodes will be `Double.infinity`
func shortestPath( G: Popgraph ) -> Matrix {
    
    let allNodes = G.nodes.map{$0.label}.sorted()
    
    G.nodes.forEach{ node in
        node.selected = false
    }
    
    var ret = Matrix(rows: allNodes.count, cols: allNodes.count, val: Double.infinity )
    ret.rowNames = allNodes
    ret.colNames = allNodes
    
    for i in 0 ..< allNodes.count {
        for j in i ..< allNodes.count {
            let path = shortestPathDijkstra(source: G.nodes[i], destination: G.nodes[j] )
            ret[i,j] = path?.length ?? Double.infinity
            ret[j,i] = path?.length ?? Double.infinity
        }
    }
    
    G.nodes.forEach{ node in
        node.selected = false
    }

    print("Shortest Path: \n\(ret)")
    
    return ret
}

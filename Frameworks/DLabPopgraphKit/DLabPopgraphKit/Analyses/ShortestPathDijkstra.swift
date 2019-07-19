//
//  shortestPathDijkstra.swift
//  DLPopgraph
//
//  Created by Rodney Dyer on 6/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/// This implements the Djikstra's Algorithm.
public func shortestPathDijkstra(source: Node, destination: Node) -> PopgraphPath? {
    
    var frontier: [PopgraphPath] = [] {
        didSet { frontier.sort {return $0.length < $1.length } }
    }
    
    
    print("from: \(source) to: \(destination)")
    frontier.append(PopgraphPath(to: source))
    
    while !frontier.isEmpty {
        
        let cheapestPath = frontier.removeFirst()
        guard !cheapestPath.node.selected else { continue }
        
        if cheapestPath.node == destination {
            return cheapestPath
        }
        
        cheapestPath.node.selected = true
        
        for edge in cheapestPath.node.edges {
            let neighbor = edge.connectedTo(node: cheapestPath.node )
            
            frontier.append( PopgraphPath(to: neighbor, via: edge, previous: cheapestPath) )
        }
    }
    
    
    return nil
}

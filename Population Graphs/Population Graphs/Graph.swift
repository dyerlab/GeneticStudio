//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

public class Graph {
    
    private var canvas: [Node]
    
    init() {
        canvas = [Node]()
    }
    
    func addNode(label: String, size: Float ) {
        let childVertex = Node()
        childVertex.key = label
        childVertex.size = size
        self.canvas.append(childVertex)
    }
    
    func addEdge(from: String, to: String, weight: Float ) {
        if let n1 = (canvas.filter{$0.key == from }).first {
            if let n2 = (canvas.filter{$0.key == to}).first {
                let edge = Edge()
                edge.weight = weight
                edge.neighbors.0 = n1
                edge.neighbors.1 = n2                
                n1.neighbors.append( edge )
                n2.neighbors.append( edge )
            }
        }
    }
}

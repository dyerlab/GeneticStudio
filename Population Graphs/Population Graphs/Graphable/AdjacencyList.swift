//
//  AdjacencyList.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T> : [Link<T>] ] = [:]
    public init() {}
}


extension AdjacencyList: Graphable {
    
    public typealias Element = T
    
    
    
    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeStr = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeStr.append( "\(edge.destination), " )
                }
                else {
                    edgeStr.append( "\(edge.destination)")
                }
            }
            result.append( "\(vertex) ----> [ \(edgeStr) ] \n")
        }
        return result
    }
    
    
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    
    
    func addEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Float) {
        
        adjacencyDict[source]?.append( Link(source: source, destination: destination, weight: weight) )
        adjacencyDict[destination]?.append( Link(source: destination, destination: source, weight: weight) )
        
    }
    
    
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Float? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    
    
    func edges(from source: Vertex<T>) -> [Link<T>]? {
        return adjacencyDict[source]
    }
    
    
}

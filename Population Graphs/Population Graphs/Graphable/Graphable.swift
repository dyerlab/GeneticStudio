//
//  Graphable.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data:Element) -> Vertex<Element>
    func addEdge( from source: Vertex<Element>, to destination: Vertex<Element>, weight: Float )
    func weight( from source: Vertex<Element>, to destination: Vertex<Element>) -> Float?
    func edges( from source: Vertex<Element>) -> [Link<Element>]?
    
}

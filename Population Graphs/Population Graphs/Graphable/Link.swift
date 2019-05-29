//
//  GraphEdge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

public struct Link<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Float
}


extension Link: Hashable {
    
    static public func==(lhs: Link<T>, rhs: Link<T>) -> Bool {
        return lhs.source == rhs.source &&
                lhs.destination == rhs.destination &&
                lhs.weight == rhs.weight
    }
}

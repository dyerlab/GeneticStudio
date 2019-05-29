//
//  Graphable.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}


extension Vertex: Hashable {
    
    static public func==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
    
}


extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

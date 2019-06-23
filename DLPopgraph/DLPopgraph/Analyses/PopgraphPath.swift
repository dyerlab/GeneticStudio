//
//  PopgraphPath.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation

public class PopgraphPath {
    public var length: Double
    public var node: Node
    public var previousPath: PopgraphPath?
    
    init(to node: Node, via edge: Edge? = nil, previous path: PopgraphPath? = nil ) {
        if
            let previousPath = path,
            let viaConnection = edge {
            self.length = viaConnection.weight + previousPath.length
        } else {
            length = 0.0
        }
        self.node = node
        self.previousPath = path
    }
    
    
    var array: [Node] {
        var array: [Node] = [self.node]
        var iterativePath = self
        while let path = iterativePath.previousPath {
            array.append( path.node )
            iterativePath = path
        }
        return array
    }
    
    
    
    func succession() -> [String] {
        let ret: [String] = array.reversed().compactMap( { $0 as Node }).map({$0.label})
        return ret
    }
    
}







extension PopgraphPath : CustomStringConvertible {
    public var description: String {
        var ret: String!
        ret = " \(node.label) (\(length)) "
        if let prev = previousPath {
            ret += String("\(prev)")
        }
        return ret
    }
}

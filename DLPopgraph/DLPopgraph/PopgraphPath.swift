//
//  PopgraphPath.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation

class PopgraphPath {
    var length: Double
    var node: PopgraphNode
    var previousPath: PopgraphPath?
    
    init(to node: PopgraphNode, via edge: PopgraphEdge? = nil, previous path: PopgraphPath? = nil ) {
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
    
    
    var array: [PopgraphNode] {
        var array: [PopgraphNode] = [self.node]
        var iterativePath = self
        while let path = iterativePath.previousPath {
            array.append( path.node )
            iterativePath = path
        }
        return array
    }
    
    
    
    func succession() -> [String] {
        let ret: [String] = array.reversed().compactMap( { $0 as PopgraphNode }).map({$0.label})
        return ret
    }
    
}







extension PopgraphPath : CustomStringConvertible {
    var description: String {
        var ret = "Path: \(node) ( \(length) ) \n"
        if let prev = previousPath {
            ret += "\(prev)"
        } else {
            ret += " -|"
        }
        return ret
    }
}

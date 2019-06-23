//
//  PopgraphNode.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation
import SceneKit

final public class Node: SCNNode  {
    var size: Double
    var label: String
    var edges: [Edge]
    var selected: Bool 
    
    init(label: String, size: Double ) {
        self.size = size
        self.label = label
        self.edges = [Edge]()
        self.selected = false
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override var description: String {
        var ret = "Node: \(self.label) sz=\(self.size)\n"
        for edge in self.edges {
            let other = edge.connectedTo(node: self)
            ret += " - \(other.label) wt=\(edge.weight)\n"
        }
        return ret
    }
}


extension Node: Codable {}



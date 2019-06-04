//
//  POpgraphEdge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit


class Edge: LineNode {
    
    fileprivate var node1: Node
    fileprivate var node2: Node
    override var description: String {
        return String("\(node1.key) <--> \(node2.key)")
    }
    
    init( from node1: Node, to node2: Node, weight: Float ) {
        self.node1 = node1
        self.node2 = node2
        super.init(from: node1.position, to: node2.position, radius: CGFloat(weight) )
    }

    func adjust() {
        self.pos1 = node1.position
        self.pos2 = node2.position
        self.adjustGeo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  POpgraphEdge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class PopgraphEdge: SCNNode {
    
    fileprivate var end1: SCNVector3
    fileprivate var end2: SCNVector3
    fileprivate var height: CGFloat {
        return distance(from: end1, to: end2)
    }
    
    init(from vec1: SCNVector3, to vec2: SCNVector3) {
        end1 = vec1
        end2 = vec2
        super.init()
        
        self.position = end1
        let node2 = SCNNode()
        node2.position = end2
        
        let nodeZAlign = SCNNode()
        nodeZAlign.eulerAngles.x = CGFloat(Float.pi/2.0)
        
        let box = SCNBox(width: 0.1, height: height, length: 0.01, chamferRadius: 0.05)
        let material = SCNMaterial()
        material.diffuse.contents = NSColor.disabledControlTextColor
        box.materials = [material]
        
        let nodeLine = SCNNode(geometry: box)
        nodeLine.position.y = CGFloat(-height/2.0)
        nodeZAlign.addChildNode(nodeLine)
        
        self.addChildNode( nodeZAlign )
        self.constraints = [SCNLookAtConstraint(target: node2)]
        
        print("Edge from: \(end1) to: \(end2)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    func distance( from vector1: SCNVector3, to vector2: SCNVector3 ) -> CGFloat {
        return CGFloat(
            sqrt(
                (vector1.x - vector2.x) * (vector1.x - vector2.x) +
                (vector1.y - vector2.y) * (vector1.y - vector2.y) +
                (vector1.z - vector2.z) * (vector1.z - vector2.z)
            )
        )
    }
}

//
//  PopgraphNode.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

struct PopgraphNodeConfig {
    let radius: Float
    let label: String
    let position: SCNVector3 = SCNVector3Make( CGFloat.random(in: 0.0...100.0),
                                               CGFloat.random(in: 0.0...100.0),
                                               CGFloat.random(in: 0.0...100.0) )
}


class PopgraphNode: SCNNode {

    var labelNode: SCNNode
    
    init( config: PopgraphNodeConfig ) {
        let text = SCNText(string: config.label, extrusionDepth: 1.0)
        labelNode = SCNNode(geometry: text)
        super.init()
        self.geometry = SCNSphere(radius: CGFloat(config.radius) )
        self.position = config.position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

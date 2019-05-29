//
//  GraphScene.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit


class GraphScene: SCNScene {

    var cameraNode = SCNNode()
    var lightNode = SCNNode()
    var axisNode = SCNNode()
    
    
    func configure() {
        lightNode.light = SCNLight()
        lightNode.light?.type = .ambient
        lightNode.position = SCNVector3(0.0, 10.0, 10.0)
        rootNode.addChildNode(lightNode)

        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(10.0, 10.0, 10.0)
        cameraNode.look(at: SCNVector3Zero )
        rootNode.addChildNode(cameraNode)
        
    }
    
    
    
    func makeBox() {
        let geo = SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0.05)
        let box = SCNNode(geometry: geo )
        box.position = SCNVector3Zero
        geo.firstMaterial!.diffuse.contents = NSColor.darkGray
        geo.firstMaterial!.specular.contents = NSColor.white
        rootNode.addChildNode( box )
    }
    
    func makeAxes() {
        let axes: [PopgraphEdge] = [
            PopgraphEdge(from: SCNVector3Make(-50.0, 0.0, 0.0),
                         to:   SCNVector3Make(50.0, 0.0, 0.0) ),
            PopgraphEdge(from: SCNVector3Make(0.0, -50.0, 0.0),
                         to:   SCNVector3Make(0.0, 50.0, 0.0) ),
          //  PopgraphEdge(from: SCNVector3Make(0.0, 0.0, -50.0),
          //               to:   SCNVector3Make(0.0, 0.0,  50.0) )
        ]
        
        for axis in axes {
            axisNode.addChildNode(axis)
        }
        
        self.rootNode.addChildNode(axisNode)
        
    }
    
    
}

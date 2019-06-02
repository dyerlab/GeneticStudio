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
        lightNode.position = SCNVector3(0.0, 0.0, 0.0)
        rootNode.addChildNode(lightNode)
        
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(60.0, 60.0, 60.0)
        cameraNode.look(at: SCNVector3Zero )
        cameraNode.camera!.automaticallyAdjustsZRange = true
        rootNode.addChildNode(cameraNode)
        
        makeAxes()
        
        toggleAxes()
        
    }
    
    
    
    func makeAxes() {
        
        let axisColorDiffuse = NSColor.darkGray
        let axisColorSpecular = NSColor.white
        
        let geo = SCNBox(width: 0.25, height: 0.25, length: 0.25, chamferRadius: 0.05)
        let box = SCNNode(geometry: geo )
        box.position = SCNVector3Zero
        geo.firstMaterial!.diffuse.contents = axisColorDiffuse
        geo.firstMaterial!.specular.contents = axisColorSpecular
        
        
        let xaxis = LineNode(from: SCNVector3Make(-50.0, 0.0, 0.0),
                             to:   SCNVector3Make(50.0, 0.0, 0.0),
                             radius: 0.02)
        xaxis.geometry?.firstMaterial!.diffuse.contents = axisColorDiffuse
        xaxis.geometry?.firstMaterial!.specular.contents = axisColorSpecular
        
        
        let yaxis = LineNode(from: SCNVector3Make(0.0, -50.0, 0.0),
                             to:   SCNVector3Make(0.0, 50.0, 0.0),
                             radius: 0.02 )
        
        yaxis.geometry?.firstMaterial!.diffuse.contents = axisColorDiffuse
        yaxis.geometry?.firstMaterial!.specular.contents = axisColorSpecular
        
        
        let zaxis = LineNode(from: SCNVector3Make(0.0, 0.0, -50.0),
                             to:   SCNVector3Make(0.0, 0.0,  50.0),
                             radius: 0.02 )
        zaxis.geometry?.firstMaterial!.diffuse.contents = axisColorDiffuse
        zaxis.geometry?.firstMaterial!.specular.contents = axisColorSpecular
        
        axisNode.addChildNode(box)
        axisNode.addChildNode(xaxis)
        axisNode.addChildNode(yaxis)
        axisNode.addChildNode(zaxis)
        
        self.rootNode.addChildNode(axisNode)
        
    }
    
    
    func toggleAxes() {
        
        if rootNode.childNodes.contains(axisNode) {
            axisNode.removeFromParentNode()
        } else {
            rootNode.addChildNode(axisNode)
        }
    }
    
    
}

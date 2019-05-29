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
    fileprivate var radius: CGFloat
    
    
    init( from vec1: SCNVector3, to vec2: SCNVector3, radius: Float ) {
        self.end1 = vec1
        self.end2 = vec2
        self.radius = CGFloat( radius )
        
        super.init()
        
        self.adjustGeo()

    }

    func adjustGeo() {
        let vector = end2 - end1
        let height = vector.length()
        let cylinder = SCNCylinder(radius: self.radius, height: height)
        cylinder.radialSegmentCount = 4
        cylinder.firstMaterial!.diffuse.contents = NSColor.darkGray
        cylinder.firstMaterial!.specular.contents = NSColor.white
        self.geometry = cylinder
        self.position = (end2+end1) / 2.0
        self.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

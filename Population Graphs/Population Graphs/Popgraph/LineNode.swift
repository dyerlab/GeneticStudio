//
//  LineNode.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/30/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit



class LineNode: SCNNode {
    
    private var radius: CGFloat
    var pos1: SCNVector3
    var pos2: SCNVector3
    
    init(from: SCNVector3, to: SCNVector3, radius: CGFloat ) {
        self.pos1 = from
        self.pos2 = to
        self.radius = radius
        
        super.init()
        
        adjustGeo()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func adjustGeo() {
        let vector = pos2 - pos1
        let height = vector.length()
        let cylinder = SCNCylinder(radius: self.radius, height: height)
        cylinder.radialSegmentCount = 4
        cylinder.firstMaterial!.diffuse.contents = NSColor.darkGray
        cylinder.firstMaterial!.specular.contents = NSColor.white
        self.geometry = cylinder
        self.position = (pos2 + pos1) / 2.0
        self.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
    }
}

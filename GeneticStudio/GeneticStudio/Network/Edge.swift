//
//  PopgraphEdge.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation
import SceneKit


final public class Edge: SCNNode  {
    
    var weight: Double
    var source: Node
    var destination: Node
    
    
    init(from: Node, to: Node, weight: Double) {
        self.source = from
        self.destination = to
        self.weight = weight
        
        super.init()
        
        adjustGeometry()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func connects(from: String, to: String ) -> Bool {
        return self.source.label == from && self.destination.label == to ||
                self.source.label == to && self.destination.label == from
    }
    
    
    func connectedTo(node: Node ) -> Node {
        return self.source == node ? self.destination : self.source
    }
    
    func adjustGeometry() {
        let vector = source.position - destination.position
        let height = CGFloat(vector.length())
        let cylinder = SCNCylinder(radius: CGFloat(self.weight), height: height)
        cylinder.radialSegmentCount = 4
        cylinder.firstMaterial!.diffuse.contents = DLColor.darkGray
        cylinder.firstMaterial!.specular.contents = DLColor.white
        self.geometry = cylinder
        self.position = (destination.position + source.position) / 2.0
        self.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
    }

}







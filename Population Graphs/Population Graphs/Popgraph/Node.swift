//
//  PopgraphNode.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit



class Node: SCNNode  {
    var key: String
    var selected: Bool
    var labelNode: SCNNode
    var edges: [Edge]
    var displacement: SCNVector3
    override var position: SCNVector3 {
        didSet {
            for e in self.edges {
                e.adjust()
            }
        }
    }
    
    override var description: String {
        return String("\(key): ( \(self.position.x) \(self.position.y) \(self.position.z) ) \(edges.count) edges")
    }
    
    
    init( config: NodeConfig ) {
        self.key = config.label
        self.selected = false
        let text = SCNText(string: config.label, extrusionDepth: 1.0)
        labelNode = SCNNode(geometry: text)
        self.edges = [Edge]()
        self.displacement = SCNVector3Zero
        super.init()
        self.geometry = SCNSphere(radius: CGFloat(config.radius) )
        self.position = SCNVector3Make( CGFloat.random(in: -50.0 ... 50.0 ),
                                        CGFloat.random(in: -50.0 ... 50.0 ),
                                        CGFloat.random(in: -50.0 ... 50.0 ))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





extension Node: NodeSelectable {
    
    func toggleSelection() {
        if self.selected {
            self.filters = nil
        }
        else {
            let bloomFilter = CIFilter(name: "CIBloom")
            bloomFilter?.setValue(5.0, forKey: "inputIntensity")
            bloomFilter?.setValue(10.0, forKey: "inputRadius")
            self.filters = ([bloomFilter] as! [CIFilter])
        }
        
        self.selected = !self.selected
    }
    
}



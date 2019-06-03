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
    let position: SCNVector3 
}


class PopgraphNode: SCNNode  {
    var key: String
    var selected: Bool
    var labelNode: SCNNode
    var edges: [PopgraphEdge]
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
    
    
    init( config: PopgraphNodeConfig ) {
        self.key = config.label
        self.selected = false
        let text = SCNText(string: config.label, extrusionDepth: 1.0)
        labelNode = SCNNode(geometry: text)
        self.edges = [PopgraphEdge]()
        super.init()
        self.geometry = SCNSphere(radius: CGFloat(config.radius) )
        self.position = config.position
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
    }
    
    
}



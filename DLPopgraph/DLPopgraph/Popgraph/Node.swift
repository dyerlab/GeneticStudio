//
//  PopgraphNode.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation
import SceneKit

final public class Node: SCNNode  {
    var size: Double
    var label: String
    var textNode: SCNNode
    var edges: [Edge]
    var selected: Bool {
        didSet {
            self.toggleSelection()
        }
    }
    var displacement: SCNVector3
    override public var position: SCNVector3 {
        didSet {
            for e in edges {
                e.adjustGeometry()
            }
        }
    }
    
    init(label: String, size: Double ) {
        self.size = size
        self.label = label
        self.edges = [Edge]()
        self.selected = false
        let text = SCNText(string: label, extrusionDepth: 1.0)
        textNode = SCNNode(geometry: text)
        self.displacement = SCNVector3Zero
        super.init()
        self.geometry = SCNSphere(radius: CGFloat(size) )
        self.position = SCNVector3Make( DLFloat.random(in: -50.0 ... 50.0 ),
                                        DLFloat.random(in: -50.0 ... 50.0 ),
                                        DLFloat.random(in: -50.0 ... 50.0 )  )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var description: String {
        var ret = "Node: \(self.label) sz=\(self.size)\n"
        for edge in self.edges {
            let other = edge.connectedTo(node: self)
            ret += " - \(other.label) wt = \(edge.weight)\n"
        }
        return ret
    }
    
    fileprivate func toggleSelection() {
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



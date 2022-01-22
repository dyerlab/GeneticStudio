//
//  GraphSpriteKitModel.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import SpriteKit

class GraphSpriteKitModel {
    var root: SKNode
    
    init( graph: Graph ) {
        self.root = SKNode()
        
        for node in graph.nodes {
            self.root.addChild( Node2D(node: node) )
            print("Added node: \(node.label)")
        }
        
        for edge in graph.edges {
            if let n1 = self.root.childNode(withName: edge.fromNode.label) as? Node2D,
               let n2 = self.root.childNode(withName: edge.toNode.label ) as? Node2D {
                self.root.addChild( Edge2D(from: n1, to: n2, weight: edge.weight))
            }
            
        }
        
        print("Root has \(self.root.children.count) children")
    }
    
    
}

//
//  GraphScene.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import SpriteKit


class GraphScene: SKScene {
    var graphViewModel: GraphSpriteKitModel?
    
    override func didMove(to view: SKView ) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
    }
    
    func addGraph( graph: Graph ) {
        self.graphViewModel = GraphSpriteKitModel(graph: graph )
        self.addChild( graphViewModel!.root )
        self.randomizeGraphNodes(within: self.size )
    }
    
    
    
    func randomizeGraphNodes( within: CGSize ) {
        
        if let nodes = graphViewModel?.nodes {
            for node in nodes {
                node.position = CGPoint(x: CGFloat.random(in: 0 ... within.width ),
                                        y: CGFloat.random(in: 0 ... within.height )
                )
            }
        }
        
        
        if let edges = graphViewModel?.edges {
            for edge in edges {
                edge.makePath()
            }
        }
    }
    
    
    #if os(OSX)
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        print( "down at \(location.x) \(location.y) ")
    }
    
    #endif

    
}

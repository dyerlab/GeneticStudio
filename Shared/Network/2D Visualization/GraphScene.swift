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
    }
}

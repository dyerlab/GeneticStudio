//
//  GraphScene.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import SpriteKit


class GraphScene: SKScene {
    
    override func didMove(to view: SKView ) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
    }
    
}

//
//  Node2D.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/24/21.
//

import Foundation
import SpriteKit

// https://github.com/joenot443/Spritekit-Force-Directed/blob/master/SpriteKit%20Force%20Directed%20Graph/Node.m


public class Node2D: SKNode {
    
    var labelNode: SKLabelNode
    var displacement: CGPoint
    var mass: CGFloat
    var mouseIsDown: Bool = true
    var edges: [Edge2D]
    
    init( node: Node ) {
        self.displacement = CGPoint.zero
        self.labelNode = SKLabelNode(text: node.label)
        self.mass = CGFloat( node.size )
        self.edges = [Edge2D]()
        
        super.init()
        
        self.name = node.label
        self.zPosition = 1.0
        self.isUserInteractionEnabled = true
        
        let shape = SKShapeNode(circleOfRadius: node.size / 2.0 )
        shape.strokeColor = .gray
        shape.fillColor = .orange
        shape.lineWidth = 1.0
        addChild( shape )
        
        labelNode.fontSize = 20.0
        labelNode.fontColor = .orange
        labelNode.position = CGPoint(x: 0.0,
                                     y: labelNode.frame.height)
        labelNode.zPosition = 3.0
        self.addChild( labelNode )
        
        let physicsBody = SKPhysicsBody(circleOfRadius:  node.size / 2.0 )
        physicsBody.affectedByGravity = false
        physicsBody.charge = -1.0
        physicsBody.mass = 1.0
        physicsBody.angularDamping = 1.0
        physicsBody.linearDamping = 0.9
        physicsBody.isDynamic = true
        self.physicsBody = physicsBody
        
        
        NotificationCenter.default.addObserver( self,
                                                selector: #selector(toggleLabel),
                                                name: .toggleNodeLabels,
                                                object: nil)
        
        if node.coordinate.isZero {
            self.position = CGPoint(x: CGFloat.random(in: 0.0 ... 500.0 ),
                                    y: CGFloat.random(in: 0.0 ... 500.0 ) )
        } else {
            self.position = CGPoint( x: node.coordinate.longitude,
                                     y: node.coordinate.latitude )
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension Node2D {
    
    
    #if os(OSX)
    public override func mouseDown(with event: NSEvent) {
        mouseIsDown = true
    }
    
    public override func mouseDragged(with event: NSEvent) {
        if mouseIsDown {
            self.position = event.location(in: self.parent! )
            self.edges.forEach { edge in
                edge.makePath()
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        if( mouseIsDown ) {
            mouseIsDown = false
            self.position = event.location(in: self.parent!)
        }
    }
    #endif 
    
}





extension Node2D {
    
    @objc func toggleLabel() {
        if self.children.contains( labelNode ) {
            labelNode.removeFromParent()
        } else {
            self.addChild( labelNode )
        }
    }
    
}













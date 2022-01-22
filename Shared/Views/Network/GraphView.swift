//
//  PopGraphView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import SwiftUI
import SpriteKit

struct GraphView: View {
    @Binding var graph: Graph
    
    var scene: SKScene {
        let scene = GraphScene()
        scene.scaleMode = .fill
        scene.addChild( GraphSpriteKitModel(graph: self.graph).root )
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
    }
}

struct PopGraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(graph: .constant(Graph.DefaultGraph()) )
    }
}

//
//  PopGraphView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import SwiftUI
import SpriteKit

struct GraphStructureView: View {
    @Binding var graph: Graph
    
    var scene: SKScene {
        let scene = GraphScene()
        scene.scaleMode = .fill
        scene.addGraph(graph: self.graph )
        return scene
    }
    
    var body: some View {
        GeometryReader { proxy in
            GraphView(scene: self.scene, proxy: proxy)
        }
    }
}

struct PopGraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphStructureView(graph: .constant(Graph.DefaultGraph()) )
    }
}

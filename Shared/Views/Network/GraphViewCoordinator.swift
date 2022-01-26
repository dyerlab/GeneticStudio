//
//  GraphViewCoordinator.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import SpriteKit
import SwiftUI

class GraphViewCoordinator: NSObject {
    
    weak var scene: GraphScene?
    
    func resizeScene( proxy: GeometryProxy ) {
        scene?.size = proxy.size
        //scene?.randomizeGraphNodes(within: proxy.size )
    }
    
}

//
//  GraphView.swift
//  DLPopgraph
//
//  Created by Rodney Dyer on 6/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

class GraphView: SCNView {
    
    func config() {
        self.allowsCameraControl = true
        self.showsStatistics = true
        self.autoenablesDefaultLighting = true
    }
    
}


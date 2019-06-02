//
//  GraphView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class GraphView: SCNView {
    
    func config() {
        self.allowsCameraControl = true
        self.showsStatistics = true
        self.backgroundColor = NSColor.controlBackgroundColor
        self.autoenablesDefaultLighting = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func updateLayer() {
        self.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        
        // Other updates.
        print("updateLayer")
    }
    
}

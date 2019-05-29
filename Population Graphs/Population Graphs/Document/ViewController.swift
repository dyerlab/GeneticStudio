//
//  ViewController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class ViewController: NSViewController {

    @IBOutlet weak var graphView: SCNView!
    var scene: GraphScene = GraphScene()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene.configure()
        scene.makeBox()
        scene.makeAxes()
        
        graphView.scene = scene
        graphView.allowsCameraControl = true
        graphView.showsStatistics = true
        graphView.backgroundColor = NSColor.controlBackgroundColor
        graphView.autoenablesDefaultLighting = true
        
    }
    
    
    
    @IBAction func onToggleStats( sender: AnyObject ) {
        graphView.showsStatistics = !graphView.showsStatistics
    }


    @IBAction func onToggleAxes( sender: AnyObject ) {
        
    }

}


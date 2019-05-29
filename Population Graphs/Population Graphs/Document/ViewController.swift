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

    @IBOutlet weak var graphView: GraphView!
    var scene: GraphScene = GraphScene()
    var popgraph: Popgraph?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.configure()
        
        popgraph = makeLopho()
        scene.rootNode.addChildNode( popgraph!.rootNode )
        
        
        graphView.config()
        graphView.scene = scene

        
    }
    
    
    
    @IBAction func onToggleStats( sender: AnyObject ) {
        graphView.showsStatistics = !graphView.showsStatistics
    }


    @IBAction func onToggleAxes( sender: AnyObject ) {
        scene.toggleAxes()
    }

}


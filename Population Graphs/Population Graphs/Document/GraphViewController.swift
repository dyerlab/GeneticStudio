//
//  ViewController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class GraphViewController: NSViewController {
    
    @IBOutlet weak var graphView: GraphView!
    var scene: GraphScene = GraphScene()
    var popgraph: Popgraph?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.configure()
        
        
        graphView.config()
        graphView.scene = scene
        
        
        NotificationCenter.default.addObserver( self,
                                                selector: #selector(setData(_:)),
                                                name: .NewDataAddedToDocument,
                                                object: nil)
        
        
    }
    
    
    
    @objc func setData(_ notification: Notification ) {
        if let ds = notification.userInfo?["DataSet"] as? DataSet {
            if let pg = ds.graph  {
                self.scene.rootNode.addChildNode( pg.rootNode )
                self.popgraph = pg
                

            }
        }
    }
    
    
    @IBAction func onToggleStats( sender: AnyObject ) {
        graphView.showsStatistics = !graphView.showsStatistics
    }
    
    
    @IBAction func onToggleAxes( sender: AnyObject ) {
        scene.toggleAxes()
    }
    
}


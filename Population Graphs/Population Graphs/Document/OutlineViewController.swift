//
//  OutlineViewController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/30/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class OutlineViewController: NSViewController {

    @IBOutlet weak var outlineScrollView: NSScrollView!
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let offset = window.frame.height - window.contentLayoutRect.maxY
        
        outlineScrollView.contentInsets.top = offset
    }
    
}

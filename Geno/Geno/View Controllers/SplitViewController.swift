//
//  SplitViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/11/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
    }
    
    
    
    @IBAction func toggleResultsViewItem(_ sender: Any ) {
        guard let item = self.splitViewItems.last else { return }
        item.isCollapsed = !item.isCollapsed
        
    }
}

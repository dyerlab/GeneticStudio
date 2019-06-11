//
//  TabbedViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/10/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class TabbedViewController: NSTabViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.toggleDataArea),
                                               name: .SwitchDataAreaNotification,
                                               object: nil)
    }
    
    
    
    @objc func toggleDataArea(_ notification: NSNotification ) {
        
        guard let area = notification.object as? TabbedDataAreaType else { return }
        
        switch area {
        case .genotype:
            self.tabView.selectTabViewItem(at: 0)
        case .map:
            self.tabView.selectTabViewItem(at: 1)
        case .popgraph:
            self.tabView.selectTabViewItem(at: 2)
        }

    }
    
}



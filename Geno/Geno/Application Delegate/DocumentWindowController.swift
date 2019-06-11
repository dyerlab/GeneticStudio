//
//  DocumentWindowController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/10/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa




class DocumentWindowController: NSWindowController {
    
    @IBOutlet weak var toggleButton: NSSegmentedControl!
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.styleMask.remove(NSWindow.StyleMask.unifiedTitleAndToolbar)
        window?.styleMask.remove(NSWindow.StyleMask.fullSizeContentView)
        window?.styleMask.insert(NSWindow.StyleMask.titled)
        window?.toolbar?.isVisible = true
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = false
        
    }
    
    @IBAction func segmentedControlSelectionStateDidChange(_ sender: Any ) {
        guard let segmentedControl = sender as? NSSegmentedControl else { return }
        guard let selected = TabbedDataAreaType( rawValue: segmentedControl.selectedSegment ) else { return }
        NotificationCenter.default.post(name: .SwitchDataAreaNotification, object: selected )
    }

    
}

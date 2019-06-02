//
//  DocumentWindowController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 6/1/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class DocumentWindowController: NSWindowController {
    

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    
    
    @IBAction func OnImportDataSet( sender: AnyObject ) {
        if let doc = self.document as? PopgraphDocument {
            doc.importDataSet()
        }
    }
}


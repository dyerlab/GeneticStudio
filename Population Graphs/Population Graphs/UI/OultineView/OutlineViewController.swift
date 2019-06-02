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
    
    var dataSet: DataSet?
    var outlineCategories = [OutlineViewCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let w = self.view.window {
            let offset = w.frame.height - w.contentLayoutRect.maxY
            outlineScrollView.contentInsets.top = offset*2
        }
        
        self.outlineView.delegate = self
        self.outlineView.dataSource = self
        
        NotificationCenter.default.addObserver( self,
                                                selector: #selector(setData(_:)),
                                                name: .NewDataAddedToDocument,
                                                object: nil)
    }
    
    
    @objc func setData(_ notification: Notification ) {
        if let ds = notification.userInfo?["DataSet"] as? DataSet {
            self.dataSet = ds
            outlineCategories.removeAll()
            let nodes = OutlineViewCategory(label: "Nodes")
            outlineCategories.append( nodes )
            
            for node in (ds.graph?.nodes.keys)! {
                let item = OutlineViewItem(label: node.key )
                nodes.items.append( item )
            }
            outlineView.reloadData()
        }
        
    }
}




extension OutlineViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if let itm = item as? OutlineViewCategory {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("HeaderCell"), owner: self) as? NSTableCellView
            view?.textField?.stringValue = itm.label
            print("label label was: \(itm.label)")
        }
        else if let itm = item as? OutlineViewItem {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("ItemView"), owner: self) as? NSTableCellView
            view?.textField?.stringValue = itm.label
        }
        
        return view
        
    }
//        var text = "undef"
//
//        if let obj = item as? OutlineViewCategory {
//            text = obj.label
//        } else if let obj = item as? OutlineViewItem {
//            text = obj.label
//        }
//
//        var tableCell: NSTableCellView
//        tableCell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "outlineObjectCell"), owner:  self)
//        tableCell.textField?.stringValue = text
//        return tableCell
//    }
    
}

extension OutlineViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let itm = item as? OutlineViewCategory {
            return itm.items[ index ]
        }
        return outlineCategories[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let itm = item as? OutlineViewCategory {
            return itm.items.count > 0
        }

        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let itm = item as? OutlineViewCategory {
            return itm.items.count
        }
        else if let _ = item as? OutlineViewItem {
            return 0
        }
        else {
            return outlineCategories.count
        }
    }
}

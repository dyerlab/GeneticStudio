//
//  GenotypeTableView.swift
//  GeneticStudio (macOS)
//
//  Created by Rodney Dyer on 1/11/22.
//

import Foundation
import SwiftUI


struct GenotypeTableView: NSViewRepresentable {
    
    typealias NSViewType = NSScrollView
    @Binding var stratum: Stratum
    
    func makeNSView(context: Context) -> NSScrollView {
        let tableView = NSTableView()
        
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.focusRingType  = .none
        tableView.usesAlternatingRowBackgroundColors = true
        
        for key in stratum.allHeadings {
            let col = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: key))
            col.headerCell.stringValue = key
            col.headerCell.alignment = .center
            tableView.addTableColumn( col )
        }
        
        let scroller = NSScrollView()
        scroller.documentView = tableView
        scroller.focusRingType = .none
        return scroller
    }
    
    func updateNSView(_ nsView: NSScrollView, context: Context) {
        //
    }
    
    func makeCoordinator() -> GenotypeTableViewCoordinator {
        let coord = GenotypeTableViewCoordinator( strata: self.stratum )
        return coord
    }
    
    
}

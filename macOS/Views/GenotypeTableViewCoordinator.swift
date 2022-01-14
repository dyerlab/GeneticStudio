//
//  GenotypeTableViewCoordinator.swift
//  GeneticStudio (macOS)
//
//  Created by Rodney Dyer on 1/11/22.
//

import Foundation
import SwiftUI
import AppKit


final class GenotypeTableViewCoordinator: NSObject, NSTableViewDelegate, NSTableViewDataSource, NSTextFieldDelegate {
    
    
    private var stratum: Stratum
    private var strataLevels: [String]
    
    init( strata: Stratum ) {
        self.stratum = strata
        self.strataLevels = strata.nestedLevels
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return stratum.individuals.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        if let colID = tableColumn?.headerCell.stringValue {
            
            let ind = stratum.individuals[row]
            
            if strataLevels.contains( colID ) {
                if let label = stratum.labelForIndividual(individual: ind, atLevel: colID) {
                    return label
                } else {
                    return "not found"
                }
            } else {

                
                if ind.loci.keys.contains( colID ) {
                    return String("\(ind.loci[colID, default: Locus()])")
                } else if colID == "Longitude" {
                    return String("\(ind.location?.longitude ?? 0.0 )")
                } else if colID == "Latitude" {
                    return String("\(ind.location?.latitude ?? 0.0 )")
                }
            }
            
        }
        
        //return individuals[row].dataForKey(key: tableColumn?.headerCell.stringValue ?? "")
        return "not found"
    }
    
    /*
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        let key = tableColumn?.headerCell.stringValue ?? ""
        let value = object as? String ?? ""
        
        /*
        if !key.isEmpty {
            individuals[row].setValueForKey(key: key, value: value)
        }
         */
    }
     */
    
}

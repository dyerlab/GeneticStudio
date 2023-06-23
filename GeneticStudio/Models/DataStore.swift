//
//  DataStore.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import Foundation


class DataStore {
    
    var individuals: [Individual] = []()
    var isEmpty: Bool {
        return individuals.count > 0
    }
    
    
}

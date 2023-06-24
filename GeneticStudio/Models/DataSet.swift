//
//  DataSet.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/24/23.
//

import Foundation
import DLGenetic

class DataSet {
    var indiviudals: [Individual]
    
    init(indiviudals: [Individual]) {
        self.indiviudals = indiviudals
    }
}





extension DataSet {
    static var defaultBajaData: DataSet {
        return DataSet( indiviudals: DataStore.DefaultBaja() )
    }
}

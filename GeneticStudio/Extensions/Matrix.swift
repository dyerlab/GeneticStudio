//
//  Matrix.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/7/23.
//

import DLMatrix
import Foundation


extension Matrix {
    
    
    public var asRows: [Vector] {
        var ret = [Vector]()
        for i in 0 ..< rows {
            ret.append( self.getRow(r: i) )
        }
        return ret
    }
    
    
}

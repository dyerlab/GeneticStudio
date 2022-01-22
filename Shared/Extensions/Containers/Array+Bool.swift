//
//  Array+Bool.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation

extension Array where Element == Bool {
    
    var any: Bool {
        for item in self {
            if item == true {
                return true
            }
        }
        return false
    }
    
    
    var all: Bool {
        for item in self {
            if item == false {
                return false
            }
        }
        return true 
    }
    
    
}

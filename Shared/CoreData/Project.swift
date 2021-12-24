//
//  Project.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/24/21.
//

import Foundation

extension Project {
    
    static func DefaultProject() -> Project {
        let ret = Project()
        ret.timestamp = Date()
        ret.species = "Cornus florida"
        return ret
    }
    
}

//
//  SCNGeometry.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/2/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import Foundation
import SceneKit

extension SCNGeometry {
    
    class func line( from: SCNVector3, to: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0,1]
        let source = SCNGeometrySource(vertices: [from, to ])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line )
        return SCNGeometry(sources: [source], elements: [element] )
    }
    
}

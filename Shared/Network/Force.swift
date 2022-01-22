//
//  Force.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 12/1/21.
//

import Foundation
import CoreGraphics


public protocol Force {
    
    func apply(nodes: [Node2D], edges: [Edge2D], bounds: CGRect )
    
}

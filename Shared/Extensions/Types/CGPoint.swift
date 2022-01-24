//
//  CGPoint.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation

extension CGPoint {
    
    static public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint( x: lhs.x - rhs.x,
                        y: lhs.y - rhs.y  )
    }
    
    static public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint( x: lhs.x + rhs.x,
                        y: lhs.y + rhs.y  )
    }
    
    
    
}

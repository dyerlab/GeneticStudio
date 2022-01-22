//
//  Array+CGPoint.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation

extension Array where Element == CGPoint {
    
    var center: CGPoint {
        return CGPoint(x: self.compactMap{ $0.x }.reduce( 0.0, + ) / CGFloat( self.count ),
                       y: self.compactMap{ $0.y }.reduce( 0.0, + ) / CGFloat( self.count ) )
        
    }
    
    var size: CGSize {
        return CGSize(width: self.compactMap{ $0.x}.max()! - self.compactMap{ $0.x}.min()!,
                      height: self.compactMap{ $0.y}.max()! - self.compactMap{ $0.y}.min()!)
    }
    
    func centerInSize( size: CGSize ) {
        
        let sz = self.size
        
        
        
    }
    
    
    
    
}

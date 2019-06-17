//
//  Array.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/13/19.
//

import Foundation

extension Array {
    
    /**
     Overload for getting a random element from an array.
     
     - Returns: Random element from array (or `nil` if empty).
     */
    public func randomElement() -> Element? {
        if isEmpty {
            return nil
        }
        let idx = Int( arc4random_uniform(UInt32(self.count)))
        return self[idx]
    }
    
}


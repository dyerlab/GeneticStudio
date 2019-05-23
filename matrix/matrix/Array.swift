//
//  Array.swift
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
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


extension Array where Element: Numeric {

    /**
     Overload for `[Double]` for sum of array.
     
     - Returns: Sum of elements in array as same Numeric type.
    */
    public func sum() -> Element {
        return reduce(0,+)
    }
    

}

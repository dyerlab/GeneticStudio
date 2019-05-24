//
//  Vector.swift
//  DLab
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

/// Alias a `[Double]` as `Vector`
public typealias Vector = [Double]

// MARK: -

/// Extend `Double` array elements for numeric operators.
extension Array where Element == Double {
    
    /// Overload vector/vector subtraction operator.
    public static func - (left: Vector, right: Vector ) -> Vector {
        return zip(left,right).map {$0 - $1}
    }
    
    /// Overload vector/scalar subtraction operator.
    public static func - (left: Vector, right: Double ) -> Vector {
        return left.map {$0 - right}
    }
    
    /// Overload vector/vector addition operator.
    public static func + (left: Vector, right: Vector ) -> Vector {
        return zip(left,right).map {$0 + $1}
    }
    
    /// Overload vector/scale addition operator.
    public static func + (vec: Vector, val: Double ) -> Vector {
        return vec.map {$0 + val }
    }
    
    /// Overload of vector/vector multiplication operator
    public static func * (left: Vector, right: Vector ) -> Vector {
        var ret = Array(repeating: 0.0, count: left.count)
        for i in 0..<left.count {
            ret[i] = left[i] * right[i]
        }
        return ret
    }
    
    /// Overload of vector/scalar operator
    public static func * (vec: Vector, val: Double ) -> Vector {
        return vec.map {$0 * val}
    }
    
    /// Overload of vector/vector division operator
    public static func / (left: Vector, right: Vector ) -> Vector {
        let N = left.count
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = left[i] / right[i]
        }
        return ret
    }
    
    /// Overload of vector/scalar operator
    public static func / (vec: Vector, val: Double ) -> Vector {
        return vec.map {$0 / val }
    }
    
    /**
     Normalize a `Vector` to sum()=1.0
     
     - Returns: A `Vector` with sum=1.0
     */
    public func normalize() -> Vector {
        let s = self.sum()
        return self / s
    }
    
    /**
     Square each element in the `Vector`
     
     - Returns: A Vector, x = x^2
    */
    public func squared() -> Vector {
        return self * self
    }
    
    /**
     Euclidean disance from this vector to the other one.
     
     - Parameters:
        - x: The other vector
     
     - Returns: A double sqrt( sum( (x-y)^2))
     */
    public func distanceTo(_ x: Vector ) -> Double {
        let N = self.count
        if N != x.count {
            fatalError()
        }
        
        return  sqrt( ( self - x ).squared().sum() )
    }
    
    /**
     Returns a slice from within the vector.
     
     - Parameters:
     - from: starting index.
     - to: ending index.
     
     - Returns: A `Vector` slided from the original one.
    */
    public func slice(from: Int, to: Int ) -> Vector {
        assert( to > from )
        var ret = Vector(repeating: 0.0, count: (to-from+1) )
        var idx = 0
        for i in from...to {
            ret[ idx ] = self[i]
            idx = idx + 1
        }
        return ret
    }
    
}

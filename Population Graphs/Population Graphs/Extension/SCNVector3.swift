//
//  SCNVector3.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit


extension SCNVector3 {
    
    func length() -> CGFloat {
        return CGFloat( sqrt( self.x*self.x + self.y*self.y + self.z*self.z ) )
    }
    
    
    func normalize() -> SCNVector3 {
        let l = self.length()
        if l == 0 {
            return SCNVector3Zero
        }
        return SCNVector3Make(self.x/l, self.y/l, self.z/l)
    }
    
    
    func midpoint( between other: SCNVector3) -> SCNVector3 {
        return SCNVector3Make( (self.x - other.x)/2.0,
                               (self.y - other.y)/2.0,
                               (self.z - other.z)/2.0  )
    }
    
    func distance( to other: SCNVector3 ) -> CGFloat {
        return CGFloat(
            sqrt(
                (self.x - other.x)*(self.x - other.x) +
                    (self.y - other.y)*(self.y - other.y) +
                    (self.z - other.z)*(self.z - other.z) ) )
    }
    
    static func lineEulerAngles(vector: SCNVector3) -> SCNVector3 {
        let height = vector.length()
        let lxz = sqrt( vector.x*vector.x + vector.z*vector.z )
        let pitchB = vector.y < 0 ? Float.pi - asinf(Float(lxz/height)) : asinf(Float(lxz/height))
        let pitch = vector.z == CGFloat(0.0) ? CGFloat(pitchB) : CGFloat(sign(Float(vector.z)) * pitchB)
        var yaw: Float = 0.0
        if vector.x != 0.0 || vector.z != 0.0 {
            let inner = vector.x / (height * CGFloat(sinf(Float(pitch))))
            if inner > 1 || inner < -1 {
                yaw = Float.pi / 2.0
            } else {
                yaw = asinf(Float(inner))
            }
        }
        
        return SCNVector3(CGFloat(pitch), CGFloat(yaw), 0)
    }
    
    static func -(lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3Make( lhs.x-rhs.x, lhs.y-rhs.y, lhs.z-rhs.z)
    }

    static func +(lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3( lhs.x+rhs.x, lhs.y+rhs.y, lhs.z+rhs.z)
    }
    
    static func /(lhs: SCNVector3, rhs: CGFloat ) -> SCNVector3 {
        return SCNVector3( lhs.x / rhs, lhs.y / rhs, lhs.z / rhs )
    }
    
    static func ==(lhs: SCNVector3, rhs: SCNVector3) -> Bool{
        return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z)
    }

    static func !=(lhs: SCNVector3, rhs: SCNVector3) -> Bool{
        return !(lhs == rhs)
    }

}

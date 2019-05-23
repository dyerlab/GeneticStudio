//
//  IdentityMatrix.swift
//  DLab
//
//  Created by Rodney Dyer on 9/16/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Produces an Identity Matrix
 
 - Parameters:
 - N: Number of rows and columns
 
 - Returns: A square matrix of zeros except for down the diagonal.
 */
public func IdentityMatrix(_ N: Int) -> Matrix {
    var ret = Matrix(rows: N, cols: N)
    for i in 0..<N {
        ret[i,i] = 1.0
    }
    return ret
}

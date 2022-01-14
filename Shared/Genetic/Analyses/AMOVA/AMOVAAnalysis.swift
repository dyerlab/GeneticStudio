//
//  File.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/28/21.
//

import Foundation


public class AMOVAAnalysis {
    public var individuals: [Individual]
    public var name: String  = "Analysis of Molecular Variance"
    
    public var C: Matrix
    public var H: Matrix
    
    public var count: Int {
        return individuals.count
    }
    
    public var dfTotal: Int {
        return self.count - 1
    }
    
    public var dfModel: Int {
        return 1 // individuals.levelsForStratum(key: partitionName).count - 1
    }
    
    public var dfError: Int {
        return dfTotal - dfModel
    }
    
    public var SSTotal: Double {
        return C.trace
    }
    
    public var SSModel: Double
    
    public var SSError: Double {
        return SSTotal - SSModel
    }
    
    public var MSModel: Double {
        if dfModel == 0 {
            return Double.infinity
        }
        return SSModel / Double(dfModel)
    }
    
    var MSError: Double {
        if dfError == 0 {
            return Double.infinity
        }
        return SSError / Double(dfError)
    }
    
    
    public init( individuals: [Individual], stratum: String  ) {
        self.individuals = individuals
        self.SSModel = 0.0
        self.H = Matrix(0,0,0.0)
        let N = self.individuals.count
        
        let D = Matrix(N,N,0.0)
        
//        for i in 0 ..< N {
//            for j in (i+1) ..< N {
//                let dist = individuals[i] - individuals[j]
//                D[i,j] = dist
//                D[j,i] = dist
//            }
//        }
        self.C = D.asCovariance
        //self.partitionName = stratum
    }
    
    
}

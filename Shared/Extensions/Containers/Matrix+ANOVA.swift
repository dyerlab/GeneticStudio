//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GeneticStudio
//  AMOVAMatrix.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation



extension Matrix {

    /*
    convenience init(individuals: [Individual]) {
        let N = individuals.count
        let D = Matrix(N,N,0.0)
        
        for i in 0 ..< N {
            for j in (i+1) ..< N {
                let dist = individuals[i] - individuals[j]
                self[i,j] = dist
                self[j,i] = dist
            }
        }
        self = D.asCovariance
    }
  */
    
}

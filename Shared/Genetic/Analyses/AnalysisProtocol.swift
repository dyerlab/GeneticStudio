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
//  AnalysisProtocol.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation

/**
 Outline for how all analyses components are configured.
 */
public protocol AnalysisProtocol {
    
    /// Must provide type enum
    var type: AnalysisType { get }
    
    /// Designated initializer, taking a stratum as input
    init( stratum: Stratum )
    
    /// Designated run function to perform the analysis.
    func run()
    
}

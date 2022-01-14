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
//  AnalysisType.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation

/**
 This is a public facing enum used by analyses routines to identify where they should be located.
 */
public enum AnalysisType: Int {
    
    /// Analyses based upon local diversity
    case GeneticDiversity
    
    /// Analyses based upon differences between components
    case GeneticStructure
    
    /// Analyses that focus on data conformance
    case DataCongruence
    
}

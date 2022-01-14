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
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//
//  GeneticErrorType.swift

import Foundation

/**
 Categories of Error types associated with genetic operations.
 */
enum GeneticErrorType: Int  {
    
    /// Errors associated with missing components
    case NotFound
    
    /// Errors associated with not being compatable
    case NotComptable
}

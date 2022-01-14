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
//  Array+Individual.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import CoreLocation
import MapKit




/**
 Extensions for arrays  of individuals
 */

extension Array where Element == Individual {

    /**
     Names of the loci
     - Returns: An array of locus names.
     */
    public var locusKeys: [String] {
        return self.first?.loci.keys.sorted() ?? [String]()
    }
    
    /**
     All keys for individual including loci and coordinates.
     - Returns: Array of keys.
     */
    public var allKeys: [String] {
        var ret = [String]()
        if let ind = self.first {
            ret.append(contentsOf: ["Longitude","Latitude"])
            ret.append(contentsOf: ind.loci.keys.sorted() )
        }
        return ret
    }
    
    /**
     All locations
     - Returns: Array of `CLLocationCoordinate2D` objects from all individuals
     */
    public var locations: [CLLocationCoordinate2D] {
        return self.compactMap{ $0.location }
    }
        
    public func getLoci( named: String ) -> [Locus] {
        return self.compactMap{ $0.loci[named] }
    }
    
}


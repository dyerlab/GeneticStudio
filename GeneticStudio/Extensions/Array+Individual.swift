//
//  Array+Individual.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/25/23.
//

import Foundation
import DLGenetic
import MapKit

extension Array where Element == Individual {
    
    var isSpatial: Bool {
        for ind in self {
            if ind.isSpatial {
                return true
            }
        }
        return false 
    }
    
    var asLocations: [Location] {
        if self.isSpatial {
            return self.compactMap { Location( name: $0.id.uuidString,
                                               coordiante: CLLocationCoordinate2DMake( $0.coord!.latitude,
                                                                                       $0.coord!.longitude ) ) }
        }
        else {
            return [Location]()
        }
    }
    
}

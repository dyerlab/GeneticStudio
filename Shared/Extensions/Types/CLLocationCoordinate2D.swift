//
//  CLLocationCoordinate2D.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    
    var isZero: Bool {
        return self.latitude == 0.0 && self.longitude == 0.0
    }

}

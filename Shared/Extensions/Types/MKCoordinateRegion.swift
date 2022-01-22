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
//  MKCoordinateRegion.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    init( coordinates: [CLLocationCoordinate2D]) {
        
        let range = coordinates.bounds()
        
        let span = MKCoordinateSpan(latitudeDelta: range.3 - range.2,
                                    longitudeDelta: range.1 - range.0 )
        
        let center = CLLocationCoordinate2DMake( CLLocationDegrees( ( range.2 + range.3 ) * 0.5),
                                                 CLLocationDegrees( ( range.0 + range.1 ) * 0.5) )
        
        self.init(center: center, span: span)
        
    }
    
    func withBuffer(scale: CGFloat) -> MKCoordinateRegion {
        var span = self.span
        span.latitudeDelta = span.latitudeDelta * scale
        span.longitudeDelta = span.longitudeDelta * scale 
        return MKCoordinateRegion(center: self.center, span: span)
    }
    
}

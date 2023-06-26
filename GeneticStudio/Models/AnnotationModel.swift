//
//  AnnotationModel.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/26/23.
//

import Foundation
import DLGenetic
import SwiftUI
import MapKit


struct AnnotationModel {
    
    var region: MKCoordinateRegion
    var annotations: [LocationAnnotation]
    
    
    
    init( individuals: [Individual] ) {
        var coords = [CLLocationCoordinate2D]()
        annotations = [LocationAnnotation]()
        
        for ind in individuals {
            if let lat = ind.latitude,
               let lon = ind.longitude {
                let coord = CLLocationCoordinate2DMake(lat, lon)
                let annotation = LocationAnnotation(title: ind.id.uuidString,
                                                    subtitle: ind.strata["Population", default: "-"],
                                                    coordinate: coord )
                annotations.append( annotation )
                coords.append( coord )
                
            }
        }
        
        region = coords.region
    }
}

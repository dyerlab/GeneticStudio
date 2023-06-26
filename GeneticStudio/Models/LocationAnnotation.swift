//
//  LocationAnnotation.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/26/23.
//

import Foundation
import AppKit

import MapKit
import SwiftUI


class LocationAnnotation:NSObject, MKAnnotation, Identifiable {
    var id = UUID() 
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}


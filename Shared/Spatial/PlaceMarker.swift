//
//  Place.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/20/21.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

struct PlaceMarker: Identifiable {
    let id = UUID()
    let name: String
    let description: String = ""
    var size: CGFloat
    let coordinate: CLLocationCoordinate2D
    
}

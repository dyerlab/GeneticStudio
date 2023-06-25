//
//  Location.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/25/23.
//

import Foundation
import MapKit


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordiante: CLLocationCoordinate2D
    
    init(name: String, coordiante: CLLocationCoordinate2D) {
        self.name = name
        self.coordiante = coordiante
    }
}

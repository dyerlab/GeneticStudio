//
//  MapView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/21/22.
//

import Foundation
import MapKit
import SwiftUI


struct MapView: NSViewRepresentable {
    
    var currentType: MKMapType = .satellite

    func makeNSView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.mapType = self.currentType
        mapView.delegate = context.coordinator
        
        
        return mapView
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        //
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(map: self)
    }
    
    
}

//
//  MapCoordinator.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/21/22.
//

import Foundation
import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate {
    
    var map: MapView
    init( map: MapView ) {
        self.map = map
        super.init()
    }
    
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("mapViewDidChangeVisibleRegion")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        polylineRenderer.strokeColor = .white
        polylineRenderer.lineWidth = 2.0
        return polylineRenderer
    }
    
    
}

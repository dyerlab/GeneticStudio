//
//  MapView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/25/23.
//

import MapKit
import SwiftUI
import DLGenetic

struct MapView: View {
    @Binding var locations: [Location]
    
    var body: some View {
        Map {
            ForEach(locations) { location in
                Marker( location.name,
                        systemImage: "tree",
                        coordinate: location.coordinate)
            }
        }
    }
}

#Preview {
    MapView( locations: .constant( [
        Location(name: "Bob", coordinate: CLLocationCoordinate2DMake(36.0, -77)),
        Location(name: "Bob", coordinate: CLLocationCoordinate2DMake(37.0, -78)),
    ] ) )
}

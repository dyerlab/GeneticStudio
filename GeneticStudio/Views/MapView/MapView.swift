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

    var locations: [Location]
    
    var body: some View {
        Map {
            ForEach( locations ) { location in
                Annotation( "\(location.name )",
                            coordinate: location.coordinate,
                            anchor: .center
                ) {
                    Image(systemName: "tree")
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle( .standard(elevation: .realistic ) )
    }
}



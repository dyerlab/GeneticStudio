//
//  MapView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import DLGenetic
import SwiftUI
import MapKit

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

#Preview {
    MapView( locations: DataStore.Default().locations )
}

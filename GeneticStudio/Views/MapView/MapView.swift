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
            }
        }
        /*
        Map( coordinateRegion: .constant(model.region),
             interactionModes: .all,
             showsUserLocation: false,
             annotationItems: model.annotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate,
                          content: AnnotationView(title: annotation.title? ?? "The title",
                                                  subtitle: annotation.subtitle? ?? "The subtitle"))
        }
         */
    }
}



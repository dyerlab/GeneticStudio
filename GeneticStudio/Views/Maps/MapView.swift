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
    var locations: [Location] {
        didSet {
            print("set to \(locations.count)")
        }
    }
    
    var body: some View {
        Map {
            ForEach( locations ) { location in
                Annotation( "\(location.name )",
                            coordinate: location.coordinate,
                            anchor: .center
                ) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill( .background )
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.red, lineWidth: 1)
                        Image(systemName: "tree")
                            .padding(4)
                    }

                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle( .hybrid(elevation: .realistic) )
    }
}

#Preview {
    MapView( locations: DataStore.Default().locations )
}

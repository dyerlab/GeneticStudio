//
//  ItemCardView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import DLGenetic
import SwiftUI
import MapKit

struct MapCardView: View {
    var title: String
    var locations: [Location]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill( .background )
            VStack {
                HStack(alignment: .center) {
                    Text("\(title)")
                        .font( .title)
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .symbolRenderingMode(.hierarchical)
                        .font( .headline )
                }
                .padding()
                Spacer()
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
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 25,
                        bottomTrailingRadius: 25,
                        topTrailingRadius: 0
                    )
                )
                .frame( minHeight: 300)
            }
        }
        
        
        
    }
}

#Preview {
    MapCardView( title: "Item Title",
                 locations: DataStore.Default().individualsAtLevel( strata: "Population",
                                                                    level: "9").locations )
}

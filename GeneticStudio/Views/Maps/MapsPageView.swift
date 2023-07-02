//
//  MapsPageView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI
import DLGenetic

struct MapsPageView: View {
    @Binding var dataStore: DataStore
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach( dataStore.strataKeys, id: \.self) { key in
                    ForEach( dataStore.individuals.levelsForStratum(named: key), id: \.self) { level in
                        
                        MapCardView(title: "\(key): \(level)",
                                    locations: dataStore.individualsAtLevel( stratum: key,
                                                                             level: level).locations )
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Maps")
    }
}

#Preview {
    MapsPageView( dataStore: .constant( DataStore.Default() ))
}

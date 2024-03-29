//
//  SummaryView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI
import DLGenetic

struct SummaryView: View {
    @Binding var document: GeneticStudioDocument
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Summary for ")
                Text("\(document.species)")
                    .italic()
            }
            .font(.largeTitle)
            
            
            Section(header: Text("Partitions").font(.headline).padding(.top), content: {
                ForEach( document.dataStore.strataKeys, id: \.self ) { key in
                    Text("\t• \(key)")
                        .italic()
                    Text("\t\t• \(document.dataStore.individuals.strataLevels(within: key).count) levels")
                    
                }
            })
            
            Section(header: Text("Spatial").font(.headline).padding(.top), content: {
                if document.dataStore.individuals.isSpatial {
                    Text("\t• Datum: Latitude/Longitude")
                    Text("\t• \(document.dataStore.individuals.numberWithCoordinates)/\(document.dataStore.count) with coordinates")
                } else {
                    Text("\t• No")
                }
            })
            
            Section( header: Text("Genetic").font(.headline).padding(.top), content: {
                ForEach( document.dataStore.locusKeys, id: \.self) { locus in
                    Text("\t• \(locus)")
                }
            })
            
            
            
        }
        .padding()
        .navigationTitle("Study Species Summary Information")
        
    }
}

#Preview {
    SummaryView(document: .constant( Defaults.geneticStudioDocument ) ) 
}

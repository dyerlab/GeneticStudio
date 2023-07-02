//
//  MapsPageView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI
import DLGenetic

struct MapsPage: View {
    @Binding var dataStore: DataStore
    var levelTypes: [String] {
        var ret = [String]()
        ret.append( "All" )
        ret.append( contentsOf: dataStore.strataKeys )
        return ret
    }
    @State var selectedLevel = "All"
    var body: some View {
        
        VStack {
            
            if selectedLevel == "All" {
                MapCardView(title: "All Individuals", locations: dataStore.locations )
                    .padding()
                
            } else {
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 10) {
                        
                        ForEach( dataStore.individuals.levelsForStratum(named: selectedLevel), id: \.self) { level in
                            
                            MapCardView(title: "\(selectedLevel): \(level)",
                                        locations: dataStore.individualsAtLevel( stratum: selectedLevel,
                                                                                 level: level).locations )
                            .padding()
                        }
                        
                    }
                    
                }
            }
            
            
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction ) {
                Picker("Level", selection: $selectedLevel) {
                    ForEach( levelTypes, id: \.self) { Text($0) }
                }
#if os(macOS)
                .pickerStyle( .menu )
#else
                .pickerStyle( .segmented)
#endif
                
                
            }
            
        }
        .navigationTitle("Maps")
        .accentColor( .red )
    }
}

#Preview {
    MapsPage( dataStore: .constant( DataStore.Default() ))
}

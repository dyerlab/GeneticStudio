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
    @State var currentMap: Int = 0
    
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
                
                MultiMapCardView(strata: selectedLevel,
                                 levels: dataStore.individuals.strataLevels(within: selectedLevel),
                                 locations: dataStore.strataLocations(strata: selectedLevel) )
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

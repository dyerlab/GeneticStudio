//
//  DiversityPage.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/2/23.
//

import SwiftUI
import DLGenetic

struct DiversityPage: View {
    @Binding var dataStore: DataStore
    
    var diversityTypes: [String] = ["Frequencies","Allelic","Genotypic","Spatial"]
    @State private var selectedDiversity = "Frequencies"
    
    var levelTypes: [String] {
        var ret = [String]()
        ret.append( "All" )
        ret.append( contentsOf: dataStore.strataKeys )
        return ret
    }
    @State var selectedLevel = "All"
    
    
    var body: some View {
        VStack(alignment: .leading ) {
            Text( "Type: \(selectedDiversity)")
            Text( "Level: \(selectedLevel)")
        }
        .padding()
        .navigationTitle("Diversity")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction ) {
                Picker("Type", selection: $selectedDiversity) {
                    ForEach( diversityTypes, id: \.self){ Text($0) }
                }
                #if os(macOS)
                .pickerStyle( .menu )
                #else
                .pickerStyle( .segmented)
                #endif
                
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
    }
}

#Preview {
    DiversityPage(dataStore: .constant(DataStore.Default()) )
}

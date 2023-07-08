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
    
    @SceneStorage("selectedDiversity") private var selectedDiversity = "Genotypic"
    @SceneStorage("viewMode") private var viewMode: DiversityViewMode = .grid
    
    
    
    var levelTypes: [String] {
        var ret = [String]()
        ret.append( "All" )
        ret.append( contentsOf: dataStore.strataKeys )
        return ret
    }
    @State var level = "Region"
    
    var body: some View {
        VStack(alignment: .leading ) {
            switch selectedDiversity {
            case "Allelic":
                AllelicDiversityPage( level: level,
                                      dataStore: dataStore)
            case "Genotypic":
                GenotypicDiversityView(level: level,
                                       diversity: level == "All" ? dataStore.diversityForAllLoci() :
                                        dataStore.diversityForAllLevelsAt(strata: level) )
            default:
                VStack{
                    Text( "Type: \(selectedDiversity)")
                    Text( "Level: \(level)")
                }
            }
        }
        .navigationTitle("Diversity")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction ) {
                Picker("View Mode", selection: $viewMode) {
                    Label("Grid",systemImage: "square.grid.3x2")
                        .tag( DiversityViewMode.grid )
                    Label("Table", systemImage: "tablecells")
                        .tag( DiversityViewMode.table )
                }
                .help("Switch display between grid of matrices and table.")
                .pickerStyle( .segmented)
          
                Picker("Type", selection: $selectedDiversity) {
                    ForEach( diversityTypes, id: \.self){ Text($0) }
                }
                .pickerStyle( .segmented)
                
                
                Picker("Level", selection: $level) {
                    ForEach( levelTypes, id: \.self) { Text($0) }
                }
                .pickerStyle( .segmented)

            }
            
        }
    }
}

#Preview {
    DiversityPage(dataStore: .constant(DataStore.Default()) )
}

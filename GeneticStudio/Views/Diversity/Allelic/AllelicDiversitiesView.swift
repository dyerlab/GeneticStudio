//
//  AllelicDiversitiesView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import DLGenetic
import SwiftUI

struct AllelicDiversitiesView: View {
    var level: String
    @State var labels: [String]
    var dataStores: [String: DataStore]
    
    var body: some View {
        
        List {
            ForEach( labels, id: \.self) { key in
                VStack {
                    Text("\(key) Allelic Diversity")
                    AllelicDiversityView(diversity: diversitiesForLocus(key:key) )
                }
                .frame(minHeight: 400)
            }
        }
        
    }
    
    private func diversitiesForLocus( key: String ) -> [GeneticDiversity] {
        let divs = dataStores[key, default: DataStore()].diversityForStratLevels(locus: key, strata: level)
        return divs
    }
    
    
    
    
}

#Preview {
    AllelicDiversitiesView( level: "Region",
                            labels: DataStore.Default().locusKeys,
                            dataStores: DataStore.Default().partition(strata: "Region") )
}

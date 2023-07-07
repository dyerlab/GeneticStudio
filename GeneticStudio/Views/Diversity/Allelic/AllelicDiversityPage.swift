//
//  AllelicDiversityPage.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLMatrix
import DLGenetic

struct AllelicDiversityPage: View {
    var level: String
    var dataStore: DataStore
    
    var body: some View {
        VStack {
            if level == "All" {
                AllelicDiversityView(label: level,
                                     matrix: Matrix.forAllelicDiversity(divs: dataStore.diversityForAllLoci()) )
                    .padding()
            }
            else {
                AllelicDiversitiesView( level: level,
                                        loci: dataStore.locusKeys,
                                        dataStores: dataStore.partition(strata: level) )
                .padding()
            }
            Spacer()
        }
        .navigationTitle("Allelic Diversity")
    }
}

#Preview {
    AllelicDiversityPage( level: "All",
                          dataStore: DataStore.Default() )
}

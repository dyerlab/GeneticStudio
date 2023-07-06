//
//  AllelicDiversityPage.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct AllelicDiversityPage: View {
    var level: String
    var dataStore: DataStore
    
    var body: some View {
        VStack {
            HStack {
                Text("Allelic Diversity for")
                Text("\(level)")
                    .italic()
            }
            .font( .title )
            if level == "All" {
                AllelicDiversityView(diversity: dataStore.diversityForAllLoci() )
            }
            else {
                AllelicDiversitiesView( level: level,
                                        labels: dataStore.locusKeys,
                                        dataStores: dataStore.partition(strata: level) )
            }
        }
    }
}

#Preview {
    AllelicDiversityPage( level: "Region",
                          dataStore: DataStore.Default() )
}

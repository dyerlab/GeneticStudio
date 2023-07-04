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
    var dataStore: DataStore
    
    var body: some View {
        List {
            ForEach( dataStore.locusKeys, id: \.self) { locus in
                Text( "Locus: \(locus)")
                    .font( .title )
                AllelicDiversityView(diversity: dataStore.individuals.locusDiversityByStrataLevel(locus: locus,
                                                                                                  stratumName: level))
            }
        }
    }
}

#Preview {
    AllelicDiversitiesView( level: "Population",
                            dataStore: DataStore.Default() )
}

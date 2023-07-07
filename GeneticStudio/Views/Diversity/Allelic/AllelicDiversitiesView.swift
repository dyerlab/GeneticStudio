//
//  AllelicDiversitiesView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//


import DLGenetic
import DLMatrix
import SwiftUI

struct AllelicDiversitiesView: View {
    var level: String
    @State var loci: [String]
    var dataStores: [String: DataStore]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach( loci, id: \.self) { locus in
                    MatrixView( colLabel: "Allelic Diversity for \(locus)",
                                matrix: diversitiesForLocus(locus: locus))
                }
            }
        }
    }
    
    private func diversitiesForLocus( locus: String ) -> Matrix {
        let divs = dataStores[locus, default: DataStore.Default()].diversityForStratLevels(locus: locus, strata: level)
        return Matrix.forGenotypicDiversity(divs: divs)
    }
    
    
    
    
}

#Preview {
    AllelicDiversitiesView( level: "Population",
                            loci: DataStore.Default().locusKeys,
                            dataStores: DataStore.Default().partition(strata: "Population") )
}

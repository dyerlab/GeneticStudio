//
//  AllelicDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct AllelicDiversityView: View {
    @State var diversity: [GeneticDiversity]
    
    var body: some View {
        
        Table(diversity) {
            TableColumn("Locus", value: \.label)
            TableColumn("N") { model in Text("\(model.N)") }
            TableColumn("A") { model in Text("\(model.A)") }
            TableColumn("A95") { model in Text("\(model.A95)") }
            TableColumn("Ae") { model in Text("\(model.Ae)") }
        }
        .padding()
    }
}

#Preview {
    AllelicDiversityView(diversity: DataStore.Default().diversityForStratLevels(locus: "LTRS", strata: "Region") )
}

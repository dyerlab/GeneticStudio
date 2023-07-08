//
//  GenotypicDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct GenotypicDiversityView: View {
    var level: String
    var diversity: [GeneticDiversity]
    
    var body: some View {
        VStack {
            if self.level == "All"  {
                Table(diversity) {
                    TableColumn("Locus", value: \.label)
                    TableColumn("N") { model in Text("\(model.N)") }
                    TableColumn("Ho") { model in Text("\(model.Ho)") }
                    TableColumn("He") { model in Text("\(model.He)") }
                    TableColumn("F") { model in Text("\(model.F)") }
                }
            } else {
                Table(diversity) {
                    TableColumn("\(level)", value: \.label)
                    TableColumn("Locus", value: \.locus)
                    TableColumn("N") { model in Text("\(model.N)") }
                    TableColumn("Ho") { model in Text("\(model.Ho)") }
                    TableColumn("He") { model in Text("\(model.He)") }
                    TableColumn("F") { model in Text("\(model.F)") }
                }
            }
        }
    }
}

#Preview {
    GenotypicDiversityView( level: "Region",
                            diversity: DataStore.Default().diversityForAllLevelsAt(strata: "Region") )
}

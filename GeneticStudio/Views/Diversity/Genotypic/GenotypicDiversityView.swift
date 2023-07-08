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
    @State private var sortOrder = [ KeyPathComparator(\GeneticDiversity.label) ]
    var sortedDiversity: [GeneticDiversity] {
        return diversity.sorted(using: sortOrder)
    }
    
    var body: some View {
        VStack {
            if self.level == "All"  {
                Table(sortedDiversity, sortOrder: $sortOrder) {
                    TableColumn("Locus", value: \.label)
                    TableColumn("N") { model in Text("\(model.N)") }
                    TableColumn("Ho") { model in Text("\(model.Ho)") }
                    TableColumn("He") { model in Text("\(model.He)") }
                    TableColumn("F") { model in Text("\(model.F)") }
                }
            } else {
                Table(sortedDiversity, sortOrder: $sortOrder) {
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

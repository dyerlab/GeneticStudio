//
//  AllelicDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLMatrix
import DLGenetic

struct AllelicDiversityView: View {
    var label: String
    var matrix: Matrix
    
    var body: some View {
        
        VStack {
            MatrixView(colLabel: label, matrix: matrix)
        }
    }
}

#Preview {
    AllelicDiversityView(label: "Allelic Diversity",
                         matrix: Defaults.allelicDiversityMatrix )
}

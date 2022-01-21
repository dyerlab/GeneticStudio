//
//  FrequencyViewModelView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/13/22.
//

import SwiftUI

struct FrequencyViewModelView: View {
    var frequencyViewModel: FrequencyViewModel
    var asNumeric: Bool
    
    let spacing: CGFloat = 8
    let boxWidth: CGFloat = 25
    
    var body: some View {
        if asNumeric {
            MatrixGridView( matrix: frequencyViewModel.asMatrix() )
        }
        else {
            BarChartGridView(frequencies: frequencyViewModel.parameters )
        }

    }
}

struct FrequencyViewModelView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "LTRS"),
                               asNumeric: true
        )
        
        FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "LTRS"),
                               asNumeric: false
        )

    }
}

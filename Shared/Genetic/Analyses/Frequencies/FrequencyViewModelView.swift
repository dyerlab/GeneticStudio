//
//  FrequencyViewModelView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/13/22.
//

import SwiftUI

struct FrequencyViewModelView: View {
    var frequencyViewModel: FrequencyViewModel
    
    let spacing: CGFloat = 8
    let boxWidth: CGFloat = 25
    
    var body: some View {
        MatrixGridView( matrix: frequencyViewModel.asMatrix() )
    }
}

struct FrequencyViewModelView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "MP20"))
    }
}

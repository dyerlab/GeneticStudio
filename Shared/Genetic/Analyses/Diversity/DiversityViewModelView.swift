//
//  DiversityViewModelView.swift
//  GeneticStudio (iOS)
//
//  Created by Rodney Dyer on 1/15/22.
//

import SwiftUI

struct DiversityViewModelView: View {
    var diversityViewModel: DiversityViewModel
    var diversityType: DiversityType
    
    var body: some View {
        if diversityType == .Allelic {
            MatrixGridView( matrix: diversityViewModel.diversityMatrix(type: diversityType ),
                            asInt: [0,1] )
        } else {
            MatrixGridView( matrix: diversityViewModel.diversityMatrix(type: diversityType ))
        }

    }
}

struct DiversityViewModelView_Previews: PreviewProvider {
    static var previews: some View {
        DiversityViewModelView(diversityViewModel: DiversityViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "MP20"),
                               diversityType: .Allelic
        )
        
        DiversityViewModelView(diversityViewModel: DiversityViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "MP20"),
                               diversityType: .Genotype
        )
    }
}

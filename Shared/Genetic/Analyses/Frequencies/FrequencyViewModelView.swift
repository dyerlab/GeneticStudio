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
        
        HStack(alignment: .center, spacing: spacing ) {
            
            // The column for the stratum names
            VStack(alignment: .leading ) {
                Text("  ")
                ForEach( frequencyViewModel.allStrata, id: \.self) { stratum in
                    Text("\(stratum)")
                        .bold()
                }
            }
            
            // Go through the alleles now
            ForEach( frequencyViewModel.allAlleles, id: \.self) { allele in
                VStack(alignment: .center){
                    Text("\(allele)")
                        .bold()
                        .font( .callout )
                        .fixedSize()
                    
                    ForEach( frequencyViewModel.allStrata, id: \.self) { stratum in
                        Text("\( freq(stratum,allele)  )")
                            .font( Font.system(.body, design: .monospaced) )
                            .fixedSize()
                    }

                }
            }
        }
        .fixedSize()
    }
    
    private func freq(_ stratum: String, _ allele: String) -> String {
        let ret = frequencyViewModel.getAlleleFrequency( stratum: stratum, allele: allele )
        if ret != 0.0 {
            return String( format: "%0.5f", ret )
        }
        else {
            return "-"
        }

    }
}

struct FrequencyViewModelView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "MP20"))
    }
}

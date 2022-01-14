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
                        Text("\( String( format: "%0.5f", freq( stratum, allele) )  )")
                            .font( Font.system(.body, design: .monospaced) )
                            .fixedSize()
                    }

                }
            }
            
            
        }
        
        /*
        VStack(alignment: .leading, spacing: spacing, content: {
            
            // Make the header row
            HStack(alignment: .center, spacing: spacing, content: {
                Text("")
                    .frame(minWidth: boxWidth)
                ForEach( frequencyViewModel.allAlleles, id: \.self) { allele in
                    Text("\(allele)")
                        .bold()
                        .frame(minWidth: boxWidth)
                }
            })
            
            
            ForEach( frequencyViewModel.allStrata, id: \.self) { stratum in
                HStack(alignment: .center, spacing: spacing) {
                    Text("\(stratum)")
                        .frame(minWidth: boxWidth)
                    ForEach( frequencyViewModel.allAlleles, id: \.self) { allele in
                        Text("\(String( format: "%.4f", frequencyViewModel.getAlleleFrequency( stratum: stratum, allele: allele ) ))")
                    }
                }
            }
            
            
        })
         */
    }
    
    private func freq(_ stratum: String, _ allele: String) -> Double {
        return frequencyViewModel.getAlleleFrequency( stratum: stratum, allele: allele )
    }
}

struct FrequencyViewModelView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                                                      level: "Region",
                                                                      locus: "LTRS"))
    }
}

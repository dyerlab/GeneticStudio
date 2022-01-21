//
//  BarChartGridView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/21/22.
//

import SwiftUI

struct BarChartGridView: View {
    var frequencies: [String: AlleleFrequencies]
    var body: some View {
        VStack(alignment: .leading) {
            
            
            ForEach( frequencies.keys.sorted(), id: \.self) { key in
                HStack{
                    Text("\(key)")
                        .bold()
                    HorizontalVectorBar( labels: frequencies[key]?.alleles ?? ["NA"],
                                         values: frequencies[key]?.frequencies ?? [0.0] )
                }
            }
        }
        .padding()
    }
}

struct BarChartGridView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartGridView(frequencies: FrequencyViewModel.DefaultFrequencyViewModel().parameters )
    }
}

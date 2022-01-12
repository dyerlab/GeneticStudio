//
//  StratumDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/11/22.
//

import SwiftUI
import DLabGenetic

struct StratumDiversityView: View {
    var level: String
    var stratum: Stratum
    var loci: [String] {
        if let ind = stratum.individuals.first {
            return ind.loci.keys.sorted {$0.localizedStandardCompare($1) == .orderedAscending}
        }
        else {
            return [String]()
        }
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(level)")
                .font(.title)
            ForEach( loci, id:\.self){ locus in
                
                
                
                HStack{
                    Text("\(locus)")
                        .font(.title2)
                    Spacer()
                    Button(action: {
                        print("asking to export")
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
                
            }
            
        }
        .padding()
    }
}

struct StratumDiversityView_Previews: PreviewProvider {
    static var previews: some View {
        StratumDiversityView(level: "All",
                             stratum: Stratum.DefaultStratum() )
    }
}

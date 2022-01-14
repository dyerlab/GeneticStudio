//
//  FrequencyView.swift
//  GeneticStudio (iOS)
//
//  Created by Rodney Dyer on 1/11/22.
//

import SwiftUI


struct FrequencyView: View {
    @State var currentLevel: Int = 0
    
    var stratum: Stratum
    
    var strataLevels: [String] {
        return stratum.nestedLevels
    }
    
    
    var body: some View {
        List {
            
            if currentLevel == 0 {
                Text("Allele Frequencies: \(strataLevels[currentLevel])")
                    .font(.title)
                StratumDiversityView(level: strataLevels[ currentLevel ],
                                     stratum: stratum )
            } else {
                ForEach( stratum.substrataAtLevel(named: strataLevels[ currentLevel]), id: \.self ) { name in
                    Text("Allele Frequencies: \(name)")
                        .font(.title)
                    StratumDiversityView( level: name,
                                          stratum: stratum.substratum(named: name)! )
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic,
                        content: {
                HStack {
                    Text("Hierarchical Level:")
                        .fixedSize()
                    Picker(selection: $currentLevel,
                           content: {
                        ForEach( 0 ..< strataLevels.count, id: \.self) {
                            Text("\(strataLevels[$0])").tag($0)
                        }
                    }, label: {
                        Text("Level:")
                    })
                        .pickerStyle( .automatic )
                }
            })
        }
    }
}

struct FrequencyView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyView( stratum: Stratum.DefaultStratum() )
    }
}

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
    
    var level: String {
        return strataLevels[currentLevel]
    }
    var strataLevels: [String] {
        return stratum.nestedLevels
    }
    
    var loci: [String] {
        if let ind = stratum.individuals.first {
            return ind.loci.keys.sorted {$0.localizedStandardCompare($1) == .orderedAscending}
        }
        else {
            return [String]()
        }
    }
    
    
    var body: some View {
        
        ScrollView([.horizontal,.vertical]) {
            
            ForEach( loci, id:\.self){ locus in
                VStack(alignment: .leading) {
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
                    FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: stratum,
                                                                                  level: level,
                                                                                  locus: locus))
                }
                .padding()
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
            .previewLayout(.sizeThatFits)
    }
}

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
    
    @State var currentOutput: Int = 0
    var asNumeric: Bool {
        return currentOutput == 0
    }
    
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
                            print("asking to export \(locus) for \(level)")
                            self.frequenciesToClipboard(locus: locus)
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                        })
                    }
                    FrequencyViewModelView(frequencyViewModel: FrequencyViewModel(stratum: stratum,
                                                                                  level: level,
                                                                                  locus: locus),
                                           asNumeric: currentOutput == 0 )
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic,
                        content: {
                
                HStack {
                    
                    Picker(selection: $currentOutput, content: {
                        Text("Numeric").tag( 0 )
                        Text("Graphical").tag( 1 )
                    }, label: {
                        Text("Style")
                    })
                        .pickerStyle( .segmented )
                    
                    
                    
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
    
    
    private func frequenciesToClipboard( locus: String ) {
        let fvm  = FrequencyViewModel(stratum: stratum, level: level, locus: locus)
        let mat = fvm.asMatrix()
        
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString( mat.toR(), forType: .string)
        print("copied \(locus) for \(level) to clipboard.")
    }
    
    
}

struct FrequencyView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyView( stratum: Stratum.DefaultStratum(),
                       currentOutput: 0 )
            .previewLayout(.sizeThatFits)
        
        FrequencyView( stratum: Stratum.DefaultStratum(),
                       currentOutput: 1  )
            .previewLayout(.sizeThatFits)

    }
}

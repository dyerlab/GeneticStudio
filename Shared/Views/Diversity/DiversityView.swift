//
//  DiversityView.swift
//  GeneticStudio (iOS)
//
//  Created by Rodney Dyer on 1/15/22.
//

import SwiftUI

struct DiversityView: View {
    @State var currentLevel: Int = 0
    var diversityType: DiversityType
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
                            print("asking to export \(locus) for \(level)")
                            self.diversityToClipboard(locus: locus)
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                        })
                    }
                    DiversityViewModelView(diversityViewModel: DiversityViewModel(stratum: stratum,
                                                                                  level: level,
                                                                                  locus: locus),
                                           diversityType: diversityType )
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
    
    
    private func diversityToClipboard( locus: String ) {
        let dvm  = DiversityViewModel(stratum: stratum, level: level, locus: locus)
        let mat = dvm.diversityMatrix(type: diversityType )
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString( mat.toR(), forType: .string)
        print("copied diversity for \(locus) for \(level) to clipboard.")
    }
    
    
}

struct DiversityView_Previews: PreviewProvider {
    static var previews: some View {
        DiversityView(diversityType: .Allelic, stratum: Stratum.DefaultStratum() ) 
    }
}

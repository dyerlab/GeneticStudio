//
//  MatrixGridView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/15/22.
//

import SwiftUI

struct MatrixGridView: View {
    var matrix: Matrix
    var dropZeros: Bool = true
    var asInt: [Int] = []
    
    var body: some View {
        HStack {
            
            // Do the Row
            VStack(alignment:.leading) {
                Text("  ")
                ForEach( matrix.rowNames, id: \.self) { name in
                    Text("\(name)")
                        .bold()
                }
            }
            
            // Go Through the columns
            ForEach( 0 ..< matrix.cols, id: \.self) { i in
                
                VStack(alignment: .center) {
                    Text("\(matrix.colNames[i])")
                        .bold()
                        .font( .callout )
                        .fixedSize()
                    
                    ForEach( 0 ..< matrix.rows, id: \.self) { j in
                        Text(" \(stringify( matrix[j,i], makeInt: asInt.contains( i ) ))")
                            .font( Font.system(.body, design: .monospaced) )
                            .fixedSize()
                    }
                }
            }
            
        }
        .fixedSize()
    }
    
    
    private func stringify(_ val: Double, makeInt: Bool ) -> String {
        let format = makeInt ? "%d" : "%3.4f"
        return (dropZeros && val == 0.0) ? "-" : String( format: format, (makeInt ? Int(val) : val ) )
    }
    
}

struct MatrixGridView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixGridView(matrix: DiversityViewModel(stratum: Stratum.DefaultStratum(),
                                                  level: "Region",
                                                  locus: "LTRS").diversityMatrix(type: .Allelic),
                       asInt:[ 0, 1]
        )
    }
}

//
//   MatrixView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/7/23.
//

import DLMatrix
import SwiftUI

struct MatrixView: View {
    var colLabel: String
    var matrix: Matrix
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill( .background )
            HStack {
                    Grid(alignment: .center) {
                        GridRow {
                            Text("")
                            Text("\(colLabel)")
                                .gridCellColumns( matrix.cols )
                                .font(.title3)
                        }
                        GridRow {
                            Text("")
                            ForEach(matrix.colNames, id: \.self){ col in
                                Text("\(col)")
                            }
                        }
                        .bold()
                        ForEach(matrix.rowNames.indices, id: \.self) { i in
                            GridRow {
                                Text("\(matrix.rowNames[i])")
                                    .bold()
                                ForEach(matrix.colNames.indices, id: \.self) { j in
                                    Text("\( matrix.formattedValue(r: i, c: j) )")
                                        .monospaced()
                                }
                            }
                        }
                    }
            }
        }
        .padding()
        
    }

    
}

#Preview {
    MatrixView( colLabel: "Alleles",
                matrix: Defaults.alleleFrequencyMatrix )
}

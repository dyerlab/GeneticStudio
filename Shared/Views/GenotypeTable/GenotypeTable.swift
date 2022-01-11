//
//  GenotypeTable.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/11/22.
//

import SwiftUI
import DLabGenetic

struct GenotypeTable: View {
    @Binding var stratum: Stratum
    
    var body: some View {
        GenotypeTableView(stratum: $stratum )
    }
}

struct GenotypeTable_Previews: PreviewProvider {
    static var previews: some View {
        GenotypeTable(stratum: .constant( Stratum.DefaultStratum() ))
    }
}

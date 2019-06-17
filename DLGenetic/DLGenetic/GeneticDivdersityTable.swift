//
//  GeneticDivdersityTable.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation



/// Takes a single population or several and returns a `Matrix` of diversity measures.
///
/// - Parameter data: The `Population` object
/// - Parameter locus: The name of the locus to estimate `GeneticDiversityType` values on.
/// - Parameter stratum: The name of the stratum to use.  If omitted, it will estimate for the whole dataset.
///
/// - Returns: A `Matrix` instance with cols for strata
func geneticDiversityTable( data: Population, locus: String, stratum: String? ) -> Matrix? {
    if data.count == 0 { return nil }
    
    let pops = data.partition(stratum: stratum ?? "" )
    let rowNames = GeneticDiversityType.allCases.map{"\($0)"}
    let numRow = rowNames.count
    let numCol = pops.count
    var ret = Matrix(rows: numRow, cols: numCol )

    ret.rowNames = rowNames
    ret.colNames = pops.keys.sorted()
    
    for r in 0 ..< ret.rowNames.count {
        let stat = rowNames[r]
        
        for c in 0 ..< ret.colNames.count {
            if let f = pops[ ret.colNames[c] ]?.frequencies[locus]?.diversity(mode: GeneticDiversityType( rawValue: stat )! ) {
                ret[r,c] = f
            }
        }
    }
    
    return ret
}

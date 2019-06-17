//
//  AlleleFrequencyTable.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation


/// Frequency to table for all and subsets of populations.
///
/// - Parameter data: A `Population` object.
/// - Parameter locus: The locus name to use.
/// - Parameter stratum: The stratum level you want to estimate frequencies across.  If not passed, this
/// will return only the total data allele frequencies.
///
/// - Returns: A `Matrix` object with row and column headers.
func alleleFrequencyTable( data: Population, locus: String, stratum: String? ) -> Matrix? {
    if data.count == 0 { return nil }
    
    let pops = data.partition(stratum: stratum ?? "" )
    guard let allAlleles = data.frequencies[locus]?.alleles else { return nil }
    let numRow = allAlleles.count
    let numCol = pops.count
    var ret = Matrix(rows: numRow, cols: numCol )
    ret.rowNames = allAlleles
    ret.colNames = pops.keys.sorted()
    
    for r in 0 ..< ret.rowNames.count {
        for c in 0 ..< ret.colNames.count {
            if let f = pops[ ret.colNames[c] ]?.frequencies[locus]?.frequency(allele: ret.rowNames[r] ) {
                ret[r,c] = f
            }
        }
    }
    
    return ret
}


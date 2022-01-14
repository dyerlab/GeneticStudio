//
//  AMOVAMatrixTest.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 11/28/21.
//

import XCTest

final class AMOVAMatrixTest: XCTestCase {

    func testCreation() throws {
    
        var individuals = [Individual]()
        let genotypes = [ "A:A", "A:B", "A:C", "A:D",
                          "B:B", "B:C", "B:D",
                          "C:C", "C:D",
                          "D:D" ]
        for geno in genotypes {
            let ind = Individual()
            ind.loci["loc1"] = Locus(raw: geno)
            individuals.append( ind )
        }
        
        
    }


}

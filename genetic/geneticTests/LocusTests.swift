//
//  LocusTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class LocusTests: XCTestCase {

    func testInit() {
        
        let locus = Locus()
    
        XCTAssertEqual(locus.count, 0)
        
        locus.genotypes.append( Genotype(left: "A",right: "B") )
        locus.genotypes.append( Genotype(left: "B",right: "B") )
        locus.genotypes.append( Genotype(left: "B",right: "B") )
        
        XCTAssertEqual(locus.count, 3)
        
    }

}

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

        locus.append( geno: Genotype(left: "A", right: "B") )
        locus.append( geno: Genotype(left: "B", right: "B") )
        locus.append( geno: Genotype(left: "B", right: "B") )

        XCTAssertEqual(locus.count, 3)

        XCTAssertEqual( locus[0], Genotype(left: "A", right: "B") )

        locus[1] = Genotype(left: "A", right: "B")
        XCTAssertEqual( locus[1], Genotype(left: "A", right: "B") )

    }

}

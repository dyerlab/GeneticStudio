//
//  GenotypeTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class GenotypeTests: XCTestCase {

    func testInit() {
        let geno1 = Genotype()
        let geno2 = Genotype(alleles: ["A", "B"])
        let geno3 = Genotype(left: "B", right: "A", phased: true)
        let geno4 = Genotype(left: "B", right: "A", phased: false)
        let geno5 = Genotype(alleles: ["A"])
        let geno6 = Genotype(alleles: ["A", "B", "C"])
        let geno7 = Genotype(alleles: ["A", "B", "C", "D"])

        XCTAssertFalse( geno1 == geno2 )
        XCTAssertTrue( geno2 == geno4 )
        XCTAssertEqual( String("\(geno1)"), "")
        XCTAssertEqual( String("\(geno2)"), "A:B")
        XCTAssertEqual( String("\(geno3)"), "B:A")

        XCTAssertEqual( geno1.ploidy, .missing)
        XCTAssertEqual( geno5.ploidy, .haploid)
        XCTAssertEqual( geno2.ploidy, .diploid)
        XCTAssertEqual( geno6.ploidy, .polyploid)
        XCTAssertEqual( geno7.ploidy, .polyploid)

    }

}

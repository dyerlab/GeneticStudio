//
//  IndividualTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class IndividualTests: XCTestCase {

    func testInit() {
        let ind = Individual()

        ind.strata["Population"] = "RVA"

        XCTAssertEqual( ind.strata["Population"], "RVA")

        ind.location = Coordinate(longitude: -77.0, latitude: 35.0)
        XCTAssertEqual( ind.location?.latitude, 35.0)
        XCTAssertEqual( ind.location?.longitude, -77.0 )

        ind.locus["TPI"] = Genotype(alleles: ["A", "B"])

        let ind2 = Individual()
        let ind3 = Individual()
        XCTAssertEqual(ind2, ind3)
        XCTAssertNotEqual(ind, ind2)

        ind.location = Coordinate(longitude: -77.0, latitude: 35.0)
        XCTAssertNotEqual(ind, ind2)

        ind2.strata["Population"] = "RVA"
        ind2.locus["TPI"] = Genotype(alleles: ["A", "B"])
        ind2.location = Coordinate(longitude: -77.0, latitude: 35.0)
        XCTAssertEqual(ind, ind2)

    }

}

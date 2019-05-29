//
//  DataSetTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class DataSetTests: XCTestCase {

    func testInit() {
        let data = DataSet()

        XCTAssertEqual(data.count, 0)

        let ind = Individual()
        ind.locus["TPI"] = Genotype(alleles: ["A", "B"])
        ind.strata["Population"] = "RVA"
        data.append(individual: ind )

        let freq = data.frequencies["TPI"]
        XCTAssertEqual(freq!.frequency(allele: "A"), 0.5)

        let ind2 = Individual()
        ind2.locus["TPI"] = Genotype(alleles: ["B", "B"])
        ind2.strata["Population"] = "Bellingham"
        data.append(individual: ind2 )

        let data2 = data.subset(key: "Population", value: "Bellingham")

        XCTAssertEqual(data2.count, 1)
        XCTAssertEqual(data2[0], data[1])
        XCTAssertEqual(data2.frequencies["TPI"]?.frequency(allele: "A"), 0.0)
        XCTAssertEqual(data2.frequencies["TPI"]?.frequency(allele: "B"), 1.0)

        let ind3 = Individual()
        ind3.locus["TPI"] = Genotype(alleles: ["A", "C"])
        ind3.strata["Population"] = "Kirkwood"

        data[1] = ind3
        XCTAssertEqual( data.frequencies["TPI"]!.alleles, ["A", "B", "C"])

        let populations = data.partition(stratum: "Population")
        XCTAssertEqual( populations.keys.sorted(), ["Kirkwood", "RVA"] )

    }

}

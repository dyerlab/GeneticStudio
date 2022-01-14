//
//  FrequencyTests.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 12/1/21.
//

import XCTest

final class FrequencyTests: XCTestCase {

    func testExample() throws {
        let pop = DefaultIndividuals(level: .all)
        XCTAssertEqual( pop.individuals.count, 363)
        
        if let mainland = pop.substratum(named: "Mainland") {
            print("\(mainland)")
            XCTAssertEqual( mainland.individuals.count, 36)
        }
        
        let df = pop.individualsFrom(named: ["101","102"])
        XCTAssertEqual( df.count, 17 )
    
        let zmp = AlleleFrequencies( loci: df.getLoci(named: "ZMP"))
        XCTAssertEqual( zmp.alleles, ["1"] )
        XCTAssertEqual( zmp.frequency(allele: "1"), 1.0 )
        XCTAssertEqual( zmp.frequency(allele: "2"), 0.0 )
        
        let aml = AlleleFrequencies( loci: df.getLoci(named: "AML") )
        XCTAssertEqual( aml.alleles, ["8","11"])
        XCTAssertEqual( aml.frequency(allele: "8"), 1.0 / 3.0 )
        XCTAssertEqual( aml.frequency(allele: "11"), 2.0 / 3.0 )
    }

}



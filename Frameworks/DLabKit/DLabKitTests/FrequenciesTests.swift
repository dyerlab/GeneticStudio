//
//  FrequenciesTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class FrequenciesTests: XCTestCase {

    func testInit() {
        let freq = Frequencies()

        XCTAssertEqual( freq.alleles, [String]() )
        XCTAssertEqual( freq.expectedHeterozygosity, 0.0 )
        XCTAssertEqual( freq.observedHeterozygosity, 0.0 )
        XCTAssertEqual( freq.frequency(allele: "Bob"), 0.0 )

        _ = String("\(freq)")
    }

    func testAddGenotype() {
        let freq = Frequencies()
        freq.add(geno: Genotype(left: "A", right: "B") )

        XCTAssertEqual( freq.alleles, ["A", "B"] )
        XCTAssertEqual( freq.expectedHeterozygosity, 0.5 )
        XCTAssertEqual( freq.observedHeterozygosity, 1.0 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.5 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.5 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles), [0.5, 0.5] )

        freq.add(geno: Genotype(left: "A", right: "A") )
        XCTAssertEqual( freq.alleles, ["A", "B"] )
        XCTAssertEqual( freq.expectedHeterozygosity, 0.375 )
        XCTAssertEqual( freq.observedHeterozygosity, 0.5 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.75 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.25 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles ), [0.75, 0.25] )

        let strObs = String("\(freq)")
        let strExp = """
Allele Frequencies:
A: 0.75
B: 0.25
"""
        XCTAssertEqual(strObs, strExp)
        
        XCTAssertEqual(freq.diversity(mode: .A ), freq.diversity(mode: .A95) )
        XCTAssertEqual(freq.diversity(mode: .Ae), 1.6)
        XCTAssertEqual(freq.diversity(mode: .Ho), 0.5)
        XCTAssertEqual(freq.diversity(mode: .He), 0.375 )
        
    }

    func testRemoveGenotypes() {
        let freq = Frequencies()
        freq.add(geno: Genotype(left: "A", right: "B") )
        freq.add(geno: Genotype(left: "A", right: "A") )

        freq.remove(geno: Genotype(left: "A", right: "A"))
        XCTAssertEqual( freq.alleles, ["A", "B"] )
        XCTAssertEqual( freq.expectedHeterozygosity, 0.5 )
        XCTAssertEqual( freq.observedHeterozygosity, 1.0 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.5 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.5 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles), [0.5, 0.5] )

        freq.remove(geno: Genotype(left: "A", right: "B") )
        XCTAssertEqual( freq.alleles, [String]() )
        XCTAssertEqual( freq.expectedHeterozygosity, 0.0 )
        XCTAssertEqual( freq.observedHeterozygosity, 0.0 )

    }

}

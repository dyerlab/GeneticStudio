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
        XCTAssertEqual( freq.expected_heterozygosity, 0.0 )
        XCTAssertEqual( freq.observed_heterozygosity, 0.0 )
        XCTAssertEqual( freq.frequency(allele: "Bob"), 0.0 )
        
        
        freq.add(geno: Genotype(left: "A",right: "B") )
        XCTAssertEqual( freq.frequency(allele: "Bob"), 0.0 )
        
        XCTAssertEqual( freq.alleles, ["A","B"] )
        XCTAssertEqual( freq.expected_heterozygosity, 0.5 )
        XCTAssertEqual( freq.observed_heterozygosity, 1.0 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.5 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.5 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles), [0.5,0.5] )
        
        
        freq.add(geno: Genotype(left: "A",right: "A") )
        XCTAssertEqual( freq.alleles, ["A","B"] )
        XCTAssertEqual( freq.expected_heterozygosity, 0.375 )
        XCTAssertEqual( freq.observed_heterozygosity, 0.5 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.75 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.25 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles ), [0.75,0.25] )
        
        let _ = String("\(freq)")
        
        freq.remove(geno: Genotype(left: "A",right: "A"))
        XCTAssertEqual( freq.alleles, ["A","B"] )
        XCTAssertEqual( freq.expected_heterozygosity, 0.5 )
        XCTAssertEqual( freq.observed_heterozygosity, 1.0 )
        XCTAssertEqual( freq.frequency(allele: "A"), 0.5 )
        XCTAssertEqual( freq.frequency(allele: "B"), 0.5 )
        XCTAssertEqual( freq.frequency(alleles: freq.alleles), [0.5,0.5] )
        
        freq.remove(geno: Genotype(left: "A",right: "B") )
        XCTAssertEqual( freq.alleles, [String]() )
        XCTAssertEqual( freq.expected_heterozygosity, 0.0 )
        XCTAssertEqual( freq.observed_heterozygosity, 0.0 )
        
    }

}

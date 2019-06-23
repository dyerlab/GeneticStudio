//
//  FileIOTests.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/13/19.
//

import XCTest

class FileIOTests: XCTestCase {
    
    func testImportGenotypeFile() {
        
        let config = InputFileFormat( strata: 3, loci: 8, coords: true )
        
        guard let path = Bundle(identifier: "com.dyerlab.DLCommon")?.path(forResource: "arapat", ofType: "csv") else { return }
        XCTAssertNotNil(path)
        
        if let pop = importGenotypeFile(path: path, format: config) {
            XCTAssertEqual( pop.count, 363)
            let locusNames = ["LTRS","WNT","EN","EF","ZMP","AML","ATPS","MP20"].sorted()
            XCTAssertEqual( pop.frequencies.keys.sorted(),  locusNames )
            XCTAssertEqual( pop.frequencies["LTRS"]?.frequency(allele: "72"), 0.0 )
            XCTAssertEqual( pop.frequencies["LTRS"]?.frequency(allele: "2"), 346.0/726.0 )
        }
        else {
            print("Failed to import")
            XCTAssertEqual(true, false)
        }
    }
    
}

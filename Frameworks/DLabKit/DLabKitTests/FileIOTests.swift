//
//  FileIOTests.swift
//  Common Framework
//
//  Created by Rodney Dyer on 6/13/19.
//

import XCTest

class FileIOTests: XCTestCase {

    
    func testParseDelimited() {
        
        
        if let path = Bundle(identifier: "com.dyerlab.DLabKit")?.path(forResource: "arapat", ofType: "csv") {
            if let raw = parseDelimitedFile(path: path, delimiter: ",") {
                XCTAssertEqual( raw.count, 364 )
                XCTAssertEqual( raw[0].count, 14 )
            } else {
                print("----------------  Cannot get file from parseDelimitedFile()")
            }
        } else {
            print("------------ Cannot load file from bundle")
            
            let docsPath = Bundle.main.resourcePath!
            let fileManager = FileManager.default
            do {
                let docsArray = try fileManager.contentsOfDirectory(atPath: docsPath)
                for item in docsArray {
                    print(item)
                }
            } catch {
                print(error)
            }
        }
        
        
    }
	
	
    
    func testImportGenotypeFile() {
        
        let config = InputFileFormat( strata: 3, loci: 8, coords: true )
        
        guard let path = Bundle(identifier: "com.dyerlab.DLabKit")?.path(forResource: "arapat", ofType: "csv") else { return }
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

//
//  FileIOTests.swift
//  Common Framework
//
//  Created by Rodney Dyer on 6/13/19.
//

import XCTest

class FileIOTests: XCTestCase {

    
    func testParseDelimited() {
        
        
        if let path = Bundle(identifier: "com.dyerlab.DLCommon")?.path(forResource: "arapat", ofType: "csv") {
            if let raw = parseDelimitedFile(path: path, delimiter: ",") {
                XCTAssertEqual( raw.count, 365 )
                XCTAssertEqual( raw[0].count, 13 )
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
    
}

//
//  FrequencyViewModelTests.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 1/15/22.
//

import XCTest

class FrequencyViewModelTests: XCTestCase {



    func testSetup() throws {
        let freqModel = FrequencyViewModel(stratum: Stratum.DefaultStratum(),
                                           level: "Region",
                                           locus: "LTRS")
        
        XCTAssertEqual( freqModel.allStrata, ["CBP","NBP","SBP","SON"] )
        XCTAssertEqual( freqModel.allAlleles, ["1","2"] )
        
        let F = freqModel.asMatrix()
        print( "\(F)")
        
        XCTAssertEqual( F.colNames, freqModel.allAlleles )
        XCTAssertEqual( F.rowNames, freqModel.allStrata )
        
    }


}

//
//  DiversityParametersTest.swift
//  
//
//  Created by Rodney Dyer on 12/17/21.
//

import XCTest



class DiversityParametersTest: XCTestCase {


    func testExample() throws {
        
        let data = DefaultIndividuals(level: .all)
        
        let individuals = data.individualsFrom(named: ["101","102"] )
        
        let aml = DiversityParameters( frequencies: AlleleFrequencies( loci: individuals.getLoci(named: "AML") ) )
        print("\(aml)")
        XCTAssertEqual( aml.A, 2 )
        XCTAssertEqual( aml.A95, 2 )
        XCTAssertEqual( aml.Ae, 1.8, accuracy: 0.000001)
        XCTAssertEqual( aml.Ho, 0.0 )
        XCTAssertEqual( aml.He, 1.0 - ( pow( (1.0/3.0), 2.0) + pow( (2.0/3.0), 2.0 )   ) )
        XCTAssertEqual( aml.F, 1.0 )
        
        let zmp = DiversityParameters( frequencies: AlleleFrequencies( loci: individuals.getLoci(named: "ZMP"))  )
        print("\(zmp)")
        XCTAssertEqual( zmp.A, 1 )
        XCTAssertEqual( zmp.A95, 1 )
        XCTAssertEqual( zmp.Ae, 1 )
        XCTAssertEqual( zmp.Ho, 0.0 )
        XCTAssertEqual( zmp.He, 0.0 )
        XCTAssertEqual( zmp.F, 0.0 )
    }


}

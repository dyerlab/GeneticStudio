//
//  IndividualTests.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 11/28/21.
//

import XCTest
import CoreLocation


final class IndividualTests: XCTestCase {

    func testEquality() throws {
        
        let ind1 = Individual()
        ind1.loci["AAT"] = Locus(raw: "A:A")
        //ind1.strata["Population"] = "RVA"
        ind1.location = CLLocationCoordinate2D(latitude: 38.0, longitude: -77.3)
        
        let ind2 = Individual()
        ind2.loci["AAT"] = Locus(raw: "A:B")
        //ind2.strata["Population"] = "RVB"
        ind2.location = CLLocationCoordinate2D(latitude: 38.0, longitude: -77.2)
        
        XCTAssertFalse( ind1 == ind2 )
        //XCTAssertEqual( ind1 - ind2, 1.0 )
        
    }

    
    func testAMOVAIndividuals() throws {
        
        let data = DefaultIndividuals(level: .all).individuals
        XCTAssertEqual( data.count, 363)
        
        
        

    }
    
    
}

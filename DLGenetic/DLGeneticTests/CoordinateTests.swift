//
//  CoordinateTests.swift
//  geneticTests
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest
import MapKit

class CoordinateTests: XCTestCase {

    func testInit() {
        let clcoord = CLLocationCoordinate2D(latitude: 35, longitude: -77)
        var rva = Coordinate(longitude: -77, latitude: 35)
        var rva2 = Coordinate(clcoord)
        let clcoord2 = CLLocationCoordinate2D(rva2)
        let rva3 = Coordinate(clcoord2)

        XCTAssertEqual(rva, rva2)
        XCTAssertEqual(rva, rva3)
        XCTAssertTrue( rva.isValid )

        rva.longitude = 420.0
        XCTAssertFalse( rva.isValid )

        rva2.latitude = -91.0
        XCTAssertFalse( rva2.isValid )
    }

}

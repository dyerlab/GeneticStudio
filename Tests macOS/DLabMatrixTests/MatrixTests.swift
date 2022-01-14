//
//  MatrixTests.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 6/7/21.
//

import XCTest


class MatrixTests: XCTestCase {
    
    func testInit() {
        let M = Matrix(4, 4, 1.0)
        
        XCTAssertEqual( M.cols, 4 )
        XCTAssertEqual( M.rows, 4 )
        XCTAssertEqual( M[0,0], 1.0)
        XCTAssertEqual( M.sum, 16.0 )
        
        XCTAssertEqual( M.diagonal, Vector.zeros(4) + 1.0)
        XCTAssertEqual( M.diagonal.sum, 4.0 )
    
        
        let rsum = M.rowSum
        XCTAssertEqual( rsum.sum, M.sum )
        XCTAssertEqual( rsum.count, 4 )
        XCTAssertEqual( rsum[0], 4.0 )
        
        XCTAssertEqual( M.rowSum, M.colSum )
        XCTAssertEqual( M.rowMatrix, Matrix(4, 4, 4.0) )
        
    }

    func testEquality() throws {
        
        let X = Matrix( 2, 2, 1...4 )
        let Y = Matrix( 2, 2, 2...5 )
        let Z = Matrix( 2, 3 )
        Z[0,0] = 1
        Z[0,1] = 2
        Z[1,0] = 3
        Z[1,1] = 4
        
        XCTAssertFalse( X == Y )
        XCTAssertFalse( X == Z )
        
        XCTAssertEqual( X, Z.submatrix([0,1], [0,1]) )
    }
    
    func testDesignMatrix() throws {
        
        let populations = ["RVA","RVA","RVA","Olympia","Olympia"]
        let X = Matrix.DesignMatrix(strata: populations )
        
        
        
        XCTAssertEqual( X.rows, 5)
        XCTAssertEqual( X.cols, 2)
        
        let H = Matrix(5,2)
        H[0,1] = 1.0
        H[1,1] = 1.0
        H[2,1] = 1.0
        H[3,0] = 1.0
        H[4,0] = 1.0
        
        XCTAssertEqual( X, H )
        
    }
    
    
    func testIdempotentDesignMatrix() throws {
        
        let populations = ["RVA","RVA","RVA","Olympia","Olympia"]
        let X = Matrix.IdempotentHatMatrix(strata: populations )
         
        let H = Matrix(5,5,0.0)
        let c1 = 1.0 / 3.0
        let c2 = 1.0 / 2.0
        
        H[0,0] = c1
        H[0,1] = c1
        H[0,2] = c1
        H[1,0] = c1
        H[1,1] = c1
        H[1,2] = c1
        H[2,0] = c1
        H[2,1] = c1
        H[2,2] = c1
        
        H[3,3] = c2
        H[3,4] = c2
        H[4,3] = c2
        H[4,4] = c2
                
        XCTAssertTrue( H == X )
        
        
    }
    
    
    
    
    
    func testConversion_DistanceCovarianceDistance() throws {
        
        var D = Matrix(3,3,0.0)
        D[0,1] = 2.0
        D[0,2] = 5.0
        D = D + D.transpose
        
        XCTAssertEqual( D[1,0], D[0,1] )
        XCTAssertEqual( D.diagonal.sum, 0.0 )
        XCTAssertEqual( D[1,2], 0.0 )
        
        let C = D.asCovariance
        XCTAssertEqual( C.rows, 3 )
        XCTAssertEqual( C.cols, C.rows )
        XCTAssertEqual( C[0,1], C[1,0] )
        XCTAssertEqual( C[2,1], C[1,2] )
        
        let D1 = C.asDistance
        XCTAssertEqual( (D.values - D1.values).sum, 0.0, accuracy: 0.00000000001 )
        
    }
    

    
    
    func testMatrixRSourceConvertable() throws {
        
        var D = Matrix(3,3,0.0)
        D[0,1] = 2.0
        D[0,2] = 5.0
        D = D + D.transpose
        
        // as Matrix Output
        let ret1 = D.toR()
        XCTAssertFalse( ret1.isEmpty )
        XCTAssertEqual( ret1, "matrix( c(0.0,2.0,5.0,2.0,0.0,0.0,5.0,0.0,0.0), ncol=3, nrow=3, byrow=TRUE)")
        
        
        // as Tibble without Key
        D.colNames = ["First","Second","Third"]
        let ret2 = D.toR()
        XCTAssertFalse( ret2.isEmpty )
        XCTAssertEqual( ret2.count, 93)
        
        D.rowNames  = ["Olympia","Ames","Richmond"]
        let ret3 = D.toR()
        XCTAssertEqual( ret3.count, 135)
    }
    
    
    
}





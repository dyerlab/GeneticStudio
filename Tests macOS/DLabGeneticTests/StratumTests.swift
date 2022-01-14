//
//  LocaleTests.swift
//  
//
//  Created by Rodney Dyer on 12/17/21.
//

import XCTest

class StratumTests: XCTestCase {
    
    
    func testDefaults() throws {
        
        let pop = DefaultIndividuals(level: .population )
        print("\(pop)")
        XCTAssertEqual( pop.individuals.count, 6)
        
        let data = DefaultIndividuals(level: .all )
        print("\(data)")
        XCTAssertEqual( data.individuals.count, 363)
        
        
        
    }
    
    
    
    
    
    
    func testAddIndividual() throws {
        
        let root = Stratum(label: "All", level: "All")
        
        let ind11 =  Individual()
        let ind12 =  Individual()
        let ind21 =  Individual()
        let ind22 =  Individual()
        let pop1levels = ["West","Olympia"]
        let pop2levels = ["West","Bellingham"]
        
        root.addIndividual(individual: ind11, strata: pop1levels, levels: ["Region","Population"] )
        root.addIndividual(individual: ind12, strata: pop1levels, levels: ["Region","Population"] )
        root.addIndividual(individual: ind21, strata: pop2levels, levels: ["Region","Population"] )
        root.addIndividual(individual: ind22, strata: pop2levels, levels: ["Region","Population"] )
        
        print( root )
        XCTAssertEqual( root.individuals.count, 4)
        
        if let olympia = root.substratum(named: "Olympia") {
            XCTAssertEqual( olympia.individuals.count, 2 )
        } else {
            XCTAssertEqual( 0, 1 )
        }
        if let bellingham = root.substratum(named: "Bellingham") {
            XCTAssertEqual( bellingham.individuals.count, 2)
        } else {
            XCTAssertEqual( 0, 1 )
        }
        
        XCTAssertNil( root.substratum(named: "Tacoma") )
        XCTAssertNotNil( root.substratum(named: "Olympia"))
        
    }
    
    
    func testIndividuals() throws {
        
        let data = DefaultIndividuals(level: .all )
        
        XCTAssertEqual( data.individuals.count, 363 )
        XCTAssertFalse( data.isLocale )
        XCTAssertEqual( data.childCount, 3 )
        XCTAssertEqual( data.childLevel, "Species" )
        XCTAssertEqual( data.level, "All" )
        if let mainland = data.substratum(named: "Mainland") {
            XCTAssertEqual( mainland.individuals.count, 36)
        } else {
            XCTAssertEqual( 0, 1)
        }
        if let sonora = data.substratum(named: "SON-B") {
            XCTAssertEqual( sonora.individuals.count, 36)
        } else {
            XCTAssertEqual( 0, 1)
        }
        if let pop101 = data.substratum(named: "101") {
            XCTAssertEqual( pop101.individuals.count, 9)
        } else {
            XCTAssertEqual( 0, 1)
        }
        
        let cape = DefaultIndividuals(level: .population)
        
        XCTAssertTrue( cape.isLocale )
        XCTAssertEqual( cape.childCount, 0 )
        XCTAssertEqual( cape.individuals.count, 6 )
        XCTAssertEqual( cape.childLevel, "No Labels")
        
    }
    
    
    
    func testSubstrataStuff() throws {
        
        let data = DefaultIndividuals(level: .all )
        
        let levels = data.nestedLevels.sorted()
        
        XCTAssertEqual( levels, ["All", "Cluster", "Population", "Species"])
        
        let all = data.stratumIdentifierForIndividuals(targetLevel: "All")
        XCTAssertEqual( all.count, 363)
        XCTAssertEqual( Array(Set(all)).count, 1 )
        
        let population = data.stratumIdentifierForIndividuals(targetLevel: "Population")
        XCTAssertEqual( population.count, 363)
        let popUniq = Array(Set(population))
        print(popUniq)
        XCTAssertEqual( popUniq.count, 39 )
        
        let cluster = data.stratumIdentifierForIndividuals(targetLevel: "Cluster")
        XCTAssertEqual( cluster.count, 363)
        let clusterUniq = Array(Set(cluster))
        print(clusterUniq)
        XCTAssertEqual( clusterUniq.count, 5 )
        
        let species = data.stratumIdentifierForIndividuals(targetLevel: "Species")
        XCTAssertEqual( species.count, 363)
        let speciesUniq = Array(Set(species))
        print( speciesUniq )
        XCTAssertEqual( speciesUniq.count, 3 )
        
        
    }
    
    func testIndividualOrderingStuff() throws {
        
        let data = DefaultIndividuals(level: .all)
        
        guard let pop156 = data.substratum(named: "156") else {
            throw GeneticError( type: .NotFound, message: "Population 156 not found" )
        }
        XCTAssertEqual( data.individuals[0], pop156.individuals[0])
        XCTAssertEqual( data.individuals[5], pop156.individuals[5])
        
        
        guard let clusterSCBPA = data.substratum(named: "SCBP-A") else {
            throw GeneticError(type: .NotFound, message: "Can't find SCBP-A" )
        }
        XCTAssertEqual( data.individuals[0], clusterSCBPA.individuals[0] )
        XCTAssertEqual( pop156.individuals[5], clusterSCBPA.individuals[5] )
        
    }
    
    
    
    func testDefaultStratum() throws {
        
        let data = Stratum.DefaultStratum()
        
        XCTAssertEqual( data.individuals.count, 365 )
        XCTAssertEqual( data.childLevel, "Region" )
        
        XCTAssertFalse( data.isLocale )
        XCTAssertTrue( data.substratum(named: "Aqu")!.isLocale )
        
        XCTAssertEqual( data.childCount, 4 )
        XCTAssertEqual( data.substratum(named: "SON")!.childCount, 3 )
        
    }
    
    
}

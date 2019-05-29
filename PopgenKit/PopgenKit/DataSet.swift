//
//  DataSet.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Default class for a data set of individuals.  This class maintains
 a dictionary of frequency objects created when adding individuals
 to the class.  As a result, all frequency related information is
 present as soon as loaded.
 */
public final class DataSet {

    /// Container for individuals accessed through append and subscript
    private var individuals: [Individual]

    /// Internal dictionary of `Frequencies` objects for each locus.
    var frequencies: [String: Frequencies]

    /// Convience for number of indiviudals in the data set
    var count: Int {
        return individuals.count
    }

    /**
     Overload of subscript operator to access individuals.  This function
     removes the old genotypes from the `Frequencies` object and adds the
     new ones as a replacement the inserts the indiviudal into the right
     index.
     
     - Parameters:
     - index: The index to get or set.
     
     - Returns: The requested `Individual` instance
     */
    subscript(index: Int) -> Individual {
        get {
            return self.individuals[index]
        }
        set(newValue) {
            let oldInd = individuals[index]
            for loc in oldInd.locus.keys {
                self.frequencies[loc]?.remove(geno: oldInd.locus[loc]!)
            }
            for loc in newValue.locus.keys {
                self.frequencies[loc]?.add(geno: newValue.locus[loc]!)
            }
            individuals[index] = newValue
        }
    }

    /// Default constructor.
    init() {
        self.individuals = [Individual]()
        self.frequencies = [String: Frequencies]()
    }

    /**
     Function to add individual to the data.
     
     - Parameters:
     - individual: The `Individual` object to add to the dataset. All `Genotype`
     objects are added to the `Frequencies` object.
     */
    func append(individual: Individual ) {
        for locus in individual.locus.keys {
            if !frequencies.keys.contains(locus) {
                frequencies[locus] = Frequencies()
            }
            frequencies[locus]!.add(geno: individual.locus[locus]! )
        }
        self.individuals.append( individual )
    }

    /**
     Extract a subset of individuals based upon a specific stratum level.
     
     - Parameters:
     - key: The name of the stratum key to look within.
     - value: The level of the stratum to select.
     
     - Returns: The `DataSet` with individuals whose key stratum == value
     */
    func subset(key: String, value: String) -> DataSet {
        let ret = DataSet()
        let inds = individuals.filter {$0.strata[key] == value}

        for ind in inds {
            ret.append(individual: ind)
        }
        return ret
    }

    /**
     Partition data into levels of strata
     
     - Parameters:
     - stratum: The name of the stratum to use as a partition.
     
     - Returns: Dictionary of `DataSet` objects, each with their appropriate individuals.
     */
    func partition( stratum: String ) -> [String: DataSet] {
        var ret = [String: DataSet]()
        let pops = Set( individuals.map {$0.strata[stratum] }.compactMap { $0 })

        for pop in pops {
            ret[pop] = self.subset(key: stratum, value: pop )
        }

        return ret
    }
}

//
//  Project+CoreDataProperties.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/24/21.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var species: String?

}

extension Project : Identifiable {

}

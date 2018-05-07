//
//  BAC+CoreDataProperties.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 5/3/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//
//

import Foundation
import CoreData


extension BAC {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BAC> {
        return NSFetchRequest<BAC>(entityName: "BAC")
    }

    @NSManaged public var name: String?
    @NSManaged public var servingSize: Float
    @NSManaged public var proof: Float

}

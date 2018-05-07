//
//  BAC+CoreDataClass.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 5/3/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//
//

import UIKit
import CoreData

@objc(BAC)
public class BAC: NSManagedObject {
    convenience init?(name: String?, servingSize: Float, proof: Float ) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: BAC.entity(), insertInto: managedContext)
        
        self.name = name
        self.servingSize = servingSize
        self.proof = proof
        
    }

}

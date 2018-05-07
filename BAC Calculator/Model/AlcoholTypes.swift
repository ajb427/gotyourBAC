//
//  AlcoholTypes1.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 5/2/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit

enum Alcohol: String, Codable {
    case Beer, Cocktail, Spirit, Wine
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

struct AlcoholTypes: Codable {
    var name: String
    var proof: Float
    var alcoholType: Alcohol
    var servingSize: Float
    var alcoholPicture: String
    
    static func retrieve() -> [AlcoholTypes] {
        guard let fileURL = Bundle.main.url(forResource: "alcohol", withExtension: "json") else { return [] }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return try decoder.decode([AlcoholTypes].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }
}

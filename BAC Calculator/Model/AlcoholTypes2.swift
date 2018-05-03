//
//  AlcoholTypes.swift
//  TableView-MiniChallenge
//
//  Created by David Pevahouse on 5/1/18.
//  Copyright © 2018 InfoTC 4500. All rights reserved.
//

import UIKit

enum Alcohol: String, Codable {
    case beer, cocktail, spirits, wine
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

struct AlcoholTypes: Codable {
    var name: String
    var proof: Float
    var alcoholType: Alcohol
    var servingSize: Int
//    var alcoholPicture: UIImage?
    
    static func retrieve() -> [AlcoholTypes] {
        guard let fileURL = Bundle.main.url(forResource: "alcohol.json", withExtension: "json") else { return [] }
        
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

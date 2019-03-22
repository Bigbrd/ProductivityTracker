//
//  Meal.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 2/18/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {

    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    static let DocumentsDictionary = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDictionary.appendingPathComponent("meals")
    
    init?(name: String, photo: UIImage?, rating:Int) {
        
        // initialize should fail if no name or rating negative or <=5
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // initialize starting properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    // MARK: Types
    struct PropertyKey {
        // static keyword indicates that these constants belong to the structure itself, not to instances of the structure. You access these constants using the structure’s name (for example, PropertyKey.name).
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // name is required. if no string, fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
            else {
                os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        
        // photo/rating is optional, so conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        // no need for optional with ints
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        //must call the designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
}

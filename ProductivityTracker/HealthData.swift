//
//  HealthData.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 3/22/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import Foundation
import RealmSwift

class HealthData: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var count: Int = Int(0)
    
    // use the realm connection to write object
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}



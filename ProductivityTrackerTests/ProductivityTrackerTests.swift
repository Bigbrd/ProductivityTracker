//
//  ProductivityTrackerTests.swift
//  ProductivityTrackerTests
//
//  Created by Bryan Dickens on 2/1/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import XCTest
@testable import ProductivityTracker

class ProductivityTrackerTests: XCTestCase {

    // MARK: meal class tests
    // confirm the meal initializes and returns object
    func testMealInitializionSucceeds() {
        // zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest positive rating
        let positiveRatingMeal = Meal.init(name: "highest", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
        // creates a nil meal because negative
        let negativeMeal = Meal.init(name: "negative", photo: nil, rating: -4)
        XCTAssertNil(negativeMeal)
        
        // rating exceeds maximum
        let overMaxMeal = Meal.init(name: "over", photo: nil, rating: 7)
        XCTAssertNil(overMaxMeal)
        
        // empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 3)
        XCTAssertNil(emptyStringMeal)

    }

}

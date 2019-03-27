//
//  AWSAnalyticsService.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 3/26/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import Foundation
import AWSCore
import AWSPinpoint

class AWSAnalyticsService : AnalyticsService {
    var pinpoint: AWSPinpoint?
    
    init() {
        let config = AWSPinpointConfiguration.defaultPinpointConfiguration(launchOptions: nil)
        pinpoint = AWSPinpoint(configuration: config)
    }
    
    func recordEvent(_ eventName: String, parameters: [String : String]?, metrics: [String : Double]?) {
        let event = pinpoint?.analyticsClient.createEvent(withEventType: eventName)
        if (parameters != nil) {
            for (key, value) in parameters! {
                event?.addAttribute(value, forKey: key)
            }
        }
        if (metrics != nil) {
            for (key, value) in metrics! {
                event?.addMetric(NSNumber(value: value), forKey: key)
            }
        }
        pinpoint?.analyticsClient.record(event!)
        pinpoint?.analyticsClient.submitEvents()
    }
}

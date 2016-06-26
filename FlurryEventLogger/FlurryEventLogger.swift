//
//  FlurryEventLogger.swift
//
//
//  Created by Anıl Göktaş on 1/17/16.
//  Copyright © 2016 Anıl Göktaş. All rights reserved.
//

import Foundation
import Flurry_iOS_SDK

typealias FlurryParameters = [String: AnyObject]

public protocol FlurryEventType {
    var eventName: String { get }
    
    var parameterKeys: [String]? { get }
}

extension FlurryEventType {
    
    var parameterKeys: [String]? { return nil }
    
    private var parameterCount: Int { return parameterKeys?.count ?? 0 }
    
    private func parameters(values parameterValues: [String]? = nil) -> FlurryParameters {
        guard let parameterValues = parameterValues, let parameterKeys = parameterKeys
            else { return FlurryParameters() }
        
        var parameters = FlurryParameters()
        for index in 0..<parameterCount {
            guard let key = parameterKeys[safeIndex: index] else { continue }
            guard let value = parameterValues[safeIndex: index] else { continue }
            parameters[key] = value
        }
        return parameters
    }
    
}

extension Flurry {
    
    public class func log<FlurryEvent: FlurryEventType>(event event: FlurryEvent, parameterValues: [String]? = nil, timed: Bool = false) -> FlurryEventRecordStatus {
        return Flurry.logEvent(event.eventName, withParameters: event.parameters(values: parameterValues), timed: timed)
    }
    
    public class func end<FlurryEvent: FlurryEventType>(timedEvent event: FlurryEvent, parameterValues: [String]? = nil) {
        Flurry.endTimedEvent(event.eventName, withParameters: event.parameters(values: parameterValues))
    }
    
}
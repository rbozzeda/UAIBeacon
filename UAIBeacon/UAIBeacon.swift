//
//  UAIBeacon.swift
//  Example
//
//  Created by Hive Dev on 9/22/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation
import CoreLocation

public class UAIBeacon : NSObject
{
    var name:String = "Null Beacon"
    var serviceUUID:NSUUID?
    var majorValue:CLBeaconMajorValue?
    var minorValue:CLBeaconMinorValue?
    var clBeacon:CLBeacon?
    
    convenience init(beaconService:UAIBeaconService, clBeacon:CLBeacon)
    {
        self.init()
        
        self.name = beaconService.name;
        self.serviceUUID = beaconService.serviceUUID;
        self.majorValue = beaconService.majorValue;
        self.minorValue = beaconService.minorValue;
        self.clBeacon = clBeacon;
    }
    
    public func proximityString() -> String
    {
        let proximity:CLProximity = (clBeacon?.proximity)!
        switch proximity
        {
        case .Unknown:
            return "Unknown"
        case .Immediate:
            return "Immediate"
        case .Near:
            return "Near"
        case .Far:
            return "Far"
        }
    }
    
    public override func isEqual(object: AnyObject?) -> Bool
    {
        if object is UAIBeaconService
        {
            return self.isEqualToBeacon(object as! UAIBeaconService)
        }
        
        return false
    }
    
    public func isEqualToBeacon(beaconService:UAIBeaconService) -> Bool
    {
        return self.minorValue == beaconService.minorValue && self.majorValue ==  beaconService.majorValue && self.serviceUUID == beaconService.serviceUUID
    }
}
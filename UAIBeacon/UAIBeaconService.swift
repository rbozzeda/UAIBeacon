//
//  UAIBeaconService.swift
//  Example
//
//  Created by Hive Dev on 9/22/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation
import CoreLocation

public class UAIBeaconService : NSObject
{
    var name:String = "Null Beacon"
    var serviceUUID:NSUUID?
    var majorValue:CLBeaconMajorValue?
    var minorValue:CLBeaconMinorValue?
    var Beacons:[CLBeacon] = []
    
    convenience init(name:String, serviceUUID:NSUUID, majorValue:CLBeaconMajorValue, minorValue:CLBeaconMinorValue)
    {
        self.init()
        
        self.name = name
        self.serviceUUID = serviceUUID
        self.majorValue = majorValue
        self.minorValue = minorValue
    }
    
    convenience init(name:String, serviceUUID:NSUUID)
    {
        self.init()
        
        self.name = name
        self.serviceUUID = serviceUUID
    }
    
    func beaconRegion() -> CLBeaconRegion
    {
        if(majorValue == nil && minorValue == nil)
        {
            return CLBeaconRegion(proximityUUID: self.serviceUUID!, identifier: self.name)
        }
        
        return CLBeaconRegion(proximityUUID: self.serviceUUID!, major: self.majorValue!, minor: self.minorValue!, identifier: self.name)
    }
    
    public override func isEqual(object: AnyObject?) -> Bool {
        
        if object is UAIBeaconService
        {
            return self.isEqualToIBeaconService(object as! UAIBeaconService)
        }
        
        return false
    }
    
    public func isEqualToIBeaconService(beaconService:UAIBeaconService) -> Bool
    {
        return (self.minorValue == beaconService.minorValue && self.majorValue == beaconService.majorValue && (self.serviceUUID?.isEqual(beaconService.serviceUUID)) != nil)
    }
}

extension CLBeacon
{
    func BeaconService() -> UAIBeaconService
    {
        let majorValue:CLBeaconMajorValue = self.major.unsignedShortValue
        let minorValue:CLBeaconMinorValue = self.minor.unsignedShortValue
        
        return UAIBeaconService(name: "Null Beacon", serviceUUID: self.proximityUUID, majorValue: majorValue, minorValue: minorValue)
    }
}
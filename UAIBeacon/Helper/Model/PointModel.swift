//
//  PointModel.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation

public class PointModel
{
    public class func getPointFromJSON(JSON:NSDictionary) -> Point
    {
        let point = Point()
        
        if let value = JSON["beacon_uuid"] as? String
        {
            point.setBeaconUUID(value)
        }
        
        if let value = JSON["beacon_bt_major"] as? String
        {
            point.setBeaconBTMajor(Int(value)!)
        }
        
        if let value = JSON["beacon_bt_minor"] as? String
        {
            point.setBeaconBTMinor(Int(value)!)
        }
        
        if let value = JSON["name"] as? String
        {
            point.setName(value)
        }
        
        if let value = JSON["street"] as? String
        {
            point.setStreet(value)
        }
        
        if let value = JSON["district"] as? String
        {
            point.setDistrict(value)
        }
        
        if let value = JSON["city"] as? String
        {
            point.setCity(value)
        }
        
        if let value = JSON["state"] as? String
        {
            point.setState(value)
        }
        
        return point
    }
}
//
//  Point.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation

public class Point
{
    private var beacon_uuid:String = ""
    private var beacon_bt_major:Int = 0
    private var beacon_bt_minor:Int = 0
    private var name:String = ""
    private var street:String = ""
    private var district:String = ""
    private var city:String = ""
    private var state:String = ""
    private var offers:[Offer] = []
    
    /* BEACON_UUID */
    public func getBeaconUUID() -> String
    {
        return beacon_uuid
    }
    
    public func setBeaconUUID(value:String)
    {
        beacon_uuid = value
    }
    
    /* BEACON_BT_MAJOR */
    public func getBeaconBTMajor() -> Int
    {
        return beacon_bt_major
    }
    
    public func setBeaconBTMajor(value:Int)
    {
        beacon_bt_major = value
    }
    
    /* BEACON_BT_MINOR */
    public func getBeaconBTMinor() -> Int
    {
        return beacon_bt_minor
    }
    
    public func setBeaconBTMinor(value:Int)
    {
        beacon_bt_minor = value
    }
    
    /* NAME */
    public func getName() -> String
    {
        return name
    }
    
    public func setName(value:String)
    {
        name = value
    }
    
    /* STREET */
    public func getStreet() -> String
    {
        return street
    }
    
    public func setStreet(value:String)
    {
        street = value
    }
    
    /* DISTRICT */
    public func getDistrict() -> String
    {
        return district
    }
    
    public func setDistrict(value:String)
    {
        district = value
    }
    
    /* CITY */
    public func getCity() -> String
    {
        return city
    }
    
    public func setCity(value:String)
    {
        city = value
    }
    
    /* STATE */
    public func getState() -> String
    {
        return state
    }
    
    public func setState(value:String)
    {
        state = value
    }
    
    /* OFFERS */
    public func getOffers() -> Array<Offer>
    {
        return offers
    }
    
    public func setOffers(value:Array<Offer>)
    {
        offers = value
    }
}
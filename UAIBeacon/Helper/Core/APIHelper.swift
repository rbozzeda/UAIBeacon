//
//  APIHelper.swift
//  Henshin
//
//  Created by Hive Dev on 7/3/15.
//  Copyright (c) 2015 Hive Dev. All rights reserved.
//

import Foundation

public class APIHelper
{
    public var access_token = "95ac2da6a85c8ac3914fe22366380a27"
    
    public func getOffers(beacon:UAIBeacon, success: (( responseObject: Point? ) -> Void)?, failure: (( error: NSError?) -> Void)?)
    {
        let uuid = beacon.serviceUUID?.UUIDString
        let major = beacon.majorValue?.hashValue
        let minor = beacon.minorValue?.hashValue
        
        let url = "/services/ws"
        var params = "action=getOffers&app_access_token=" + access_token
        params = params + "&beacon_uuid=" + uuid!
        params = NSString(format: "%@&beacon_bt_major=%i", params, major!) as String
        params = NSString(format: "%@&beacon_bt_minor=%i", params, minor!) as String
        params = params + "&age_gate=Y"
        
        WebClient.HTTPResponse(url, params: params, success: { (responseObject) -> Void in

            if let error = responseObject!.objectForKey("error") as? String
            {
                if(error == "0")
                {
                    if let value = responseObject!.objectForKey("point_of_sale") as? NSDictionary
                    {
                        let point = PointModel.getPointFromJSON(value)
                        
                        if let value = responseObject!.objectForKey("offers") as? NSArray
                        {
                            let offers = OfferModel.getOffersFromJSON(value)
                            point.setOffers(offers)
                        }
                        success!(responseObject: point)
                        return
                    }
                    
                } else {
                    
                    failure!(error: NSError(domain: "/services/ws", code: 1, userInfo: nil))
                }
            }
            
            }) { (error) -> Void in
            
            failure!(error: error)
        }
    }
}
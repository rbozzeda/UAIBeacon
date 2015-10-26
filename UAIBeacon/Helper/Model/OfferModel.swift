//
//  OfferModel.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation

public class OfferModel
{
    public class func getOffersFromJSON(JSON:NSArray) -> Array<Offer>
    {
        var offers:[Offer] = []
        offers.removeAll(keepCapacity: true)
        
        let JSONArray = JSON
        if JSONArray.count == 0
        {
            return offers
        }
        
        for (var i = 0; i < JSONArray.count; i++)
        {
            let obj:NSDictionary = JSONArray.objectAtIndex(i) as! NSDictionary
            let offer = self.getOfferFromJSON(obj)
            
            offers.append(offer)
        }
        
        return offers
    }
    
    public class func getOfferFromJSON(JSON:NSDictionary) -> Offer
    {
        let offer = Offer()
        
        if let value = JSON["offer_text"] as? String
        {
            offer.setText(value)
        }
        
        if let value = JSON["expire_date"] as? String
        {
            offer.setExpirationDate(value)
        }
        
        return offer
    }
}

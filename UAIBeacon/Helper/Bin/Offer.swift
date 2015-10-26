//
//  Offer.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation

public class Offer
{
    private var text:String = ""
    private var expiration_date:String = ""
    
    /* TEXT */
    public func getText() -> String
    {
        return text
    }
    
    public func setText(value:String)
    {
        text = value
    }
    
    /* EXPIRATION_DATE */
    public func getExpirationDate() -> String
    {
        return expiration_date
    }
    
    public func setExpirationDate(value:String)
    {
        expiration_date = value
    }
}
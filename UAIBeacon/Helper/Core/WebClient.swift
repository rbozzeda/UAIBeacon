//
//  WebClient.swift
//  Henshin
//
//  Created by Hive Dev on 7/3/15.
//  Copyright (c) 2015 Hive Dev. All rights reserved.
//

import Foundation

public class WebClient
{
    public class func HTTPResponse(urlString:String, params:String, success: (( responseObject: NSDictionary? ) -> Void)?, failure: (( error: NSError? ) -> Void)?)
    {
        let url = NSURL(string: "http://ambev.beacons.hive.com.br" + urlString)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        let data = params.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = data
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in

            if(error != nil)
            {
                failure!(error: error)
                return
            }
            
            do
            {
                let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                success!(responseObject: jsonResult)
            
            } catch let error as NSError
            {
                failure!(error: error)
            }
            
        }
    }
}
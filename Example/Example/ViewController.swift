//
//  ViewController.swift
//  Example
//
//  Created by Hive Dev on 9/22/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import UIKit
import CoreLocation
import UAIBeacon

class ViewController: UITableViewController, UAIBeaconManagerDelegate
{

    var beaconManager:UAIBeaconManager!
    var detectedBeacons:[UAIBeacon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uuidString = "2EDB7643-3B2D-488A-90D9-FC9A1F67EF6B"
        let beaconUUID:NSUUID = NSUUID(UUIDString: uuidString)!
        
        let beaconService = UAIBeaconService(name: "apple", serviceUUID: beaconUUID)
        
        beaconManager = UAIBeaconManager()
        beaconManager.delegate = self
        beaconManager.BeaconServices = [beaconService]
        beaconManager.startScan()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return detectedBeacons.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let beacon = detectedBeacons[indexPath.section]
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BeaconTableViewCell
        cell.UUID.text = beacon.serviceUUID?.UUIDString
        cell.majorMinor.text = NSString(format: "Major: %i | Minor: %i", (beacon.majorValue?.hashValue)!, (beacon.minorValue?.hashValue)!) as String
        cell.rssi.text = NSString(format: "RSSI: %i", (beacon.clBeacon?.rssi.hashValue)!) as String
        cell.proximity.text = "Proximity: " + beacon.proximityString()
        cell.distance.text = NSString(format: "Distance: %.2fm", (beacon.clBeacon?.accuracy)!) as String
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let detail = DetailTableViewController(beacon: detectedBeacons[indexPath.section])
        self.navigationController?.pushViewController(detail, animated: true)
    }

    //MARK: BEACON MANAGER DELEGATE
    func BeaconManagerIBeaconsDetectedChanged(Beacons: [UAIBeacon])
    {
        detectedBeacons = Beacons
        self.tableView.reloadData()
    }
}


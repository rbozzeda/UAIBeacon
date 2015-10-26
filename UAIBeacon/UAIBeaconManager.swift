//
//  UAIBeaconManager.swift
//  Example
//
//  Created by Hive Dev on 9/22/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

protocol UAIBeaconManagerDelegate
{
    func BeaconManagerIBeaconsDetectedChanged(Beacons:[UAIBeacon])
}

public class UAIBeaconManager : NSObject, CLLocationManagerDelegate
{
    var delegate:UAIBeaconManagerDelegate?
    var debugMode = false

    var locationManager: CLLocationManager!
    var BeaconServices:[UAIBeaconService] = []
    var detectedBeacons:[UAIBeacon] = []
    
    var detectInBackground = true
    
    public func startScan()
    {
        self.turnOnLocation()
    }
    
    public func stopScan()
    {
        self.turnOffLocation()
    }
    
    //MARK: Location Manager
    func turnOnLocation() -> Bool
    {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        
        if(detectInBackground)
        {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        if(CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion.self))
        {
            for BeaconService in self.BeaconServices
            {
                self.startMonitoringIBeaconService(BeaconService)
            }
            
        } else {
            
            if(debugMode)
            {
                print("Can't monitor beacon regions")
            }
            
            return false
        }
        
        return true
    }
    
    func turnOffLocation() -> Bool
    {
        if(CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion.self))
        {
            for BeaconService in self.BeaconServices
            {
                self.stopMonitoringIBeaconService(BeaconService)
            }
        }
        
        self.locationManager.stopUpdatingLocation()
        self.locationManager = nil
        
        return true
        
    }
    
    func startMonitoringIBeaconService(beaconService:UAIBeaconService)
    {
        let beaconRegion = beaconService.beaconRegion()
        
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyEntryStateOnDisplay = true
        beaconRegion.notifyOnExit = true
        
        self.locationManager.startMonitoringForRegion(beaconRegion)
        self.locationManager.startRangingBeaconsInRegion(beaconRegion)
        self.locationManager.startUpdatingLocation()
    }
    
    func stopMonitoringIBeaconService(iBconService:UAIBeaconService)
    {
        let beaconRegion = iBconService.beaconRegion()
        
        self.locationManager.stopMonitoringForRegion(beaconRegion)
        self.locationManager.stopRangingBeaconsInRegion(beaconRegion)
    }
    
    public func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion)
    {
        if(debugMode)
        {
            print("Did range beacons: " + region.proximityUUID.UUIDString)
        }
        
        detectedBeacons.removeAll(keepCapacity: true)
        for beacon in beacons
        {
            let beaconService = beacon.BeaconService()
            let uaibeacon = UAIBeacon(beaconService: beaconService, clBeacon: beacon)
            
            detectedBeacons.append(uaibeacon)
        }
        
        self.delegate?.BeaconManagerIBeaconsDetectedChanged(detectedBeacons)
    }
    
    public func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion)
    {
        if(debugMode)
        {
            print("Did enter region beacons: " + region.identifier)
        }
    }
    
    public func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion)
    {
        if(debugMode)
        {
            print("Did exit region beacons: " + region.identifier)
        }
    }
    
    func didDetectCLBeacon(clBeacon:CLBeacon)
    {
        let tmpIBeaconService = clBeacon.BeaconService()
        
        for beaconService in self.BeaconServices
        {
            if(beaconService.isEqualToIBeaconService(tmpIBeaconService))
            {
                let beacon = UAIBeacon(beaconService: beaconService, clBeacon: clBeacon)
                
                self.didDetectIBeacon(beacon)
            }
        }
    }
    
    func didDetectIBeacon(beacon:UAIBeacon)
    {
        self.delegate?.BeaconManagerIBeaconsDetectedChanged(detectedBeacons)
    }
}
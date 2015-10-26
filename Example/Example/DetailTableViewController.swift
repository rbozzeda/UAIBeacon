//
//  DetailTableViewController.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import UIKit
import UAIBeacon

class DetailTableViewController: UITableViewController
{
    var beacon:UAIBeacon?
    var point = Point()
    
    //MARK: INIT
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(beacon:UAIBeacon)
    {
        self.init(nibName: "DetailTableViewController", bundle: .mainBundle())
        
        self.beacon = beacon
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiHelper = APIHelper()
        
        
        apiHelper.getOffers(beacon!, success: { (responseObject) -> Void in
            
            self.point = responseObject!
            self.tableView.reloadData()
            
            }) { (error) -> Void in
                
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return point.getOffers().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = self.point.getOffers()[indexPath.row].getText()
        cell.textLabel?.sizeToFit()
        
        return cell
    }
}

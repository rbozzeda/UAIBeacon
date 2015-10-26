//
//  BeaconTableViewCell.swift
//  Example
//
//  Created by Hive Dev on 9/23/15.
//  Copyright © 2015 Hive. All rights reserved.
//

import UIKit

class BeaconTableViewCell: UITableViewCell
{
    @IBOutlet var UUID:UILabel!
    @IBOutlet var majorMinor:UILabel!
    @IBOutlet var rssi:UILabel!
    @IBOutlet var proximity:UILabel!
    @IBOutlet var distance:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

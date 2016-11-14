//
//  LogController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/6.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class LogController : UITableViewController {
    
    /**
     Back to preview controller
     */
    @IBAction func closeClick(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
}

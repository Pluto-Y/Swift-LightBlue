//
//  NewVirtualPeripheralController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/7.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class NewVirtualPeripheralController : UITableViewController {
    
    private let virtualPeripheralNames = ["Alert Notification", "Blood Pressure", "Cycling Power", "Cycling Speed and Cadence", "Find Me", "Glucose", "HID OVER GATT", "Hleath Thermometer", "Heart Rate", "Location and Navigation", "Phone Alert Status", "Polar HR Sensor", "Proximity", "Running Speed and Cadence", "Scan Parameters", "Temperature Alarm Service", "Time"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAll()
    }
    
    // MARK: Custom functions
    func initAll() {
        // init prompt without animation and let the navigationBar do not overlap with uitableview
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
    }
    
    // MARK: Callback functions
    /**
     Cancel add new virtual peripheral
     */
    @IBAction func cancelClick(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // MARK: Delegate
    // MARK: UITableViewDelegate & UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return virtualPeripheralNames.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("newVirtualPeripheralCell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "newVirtualPeripheralCell")
            cell?.selectionStyle = .None
        }
        cell?.textLabel?.text = virtualPeripheralNames[indexPath.row]
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath, row:\(indexPath.row)")
    }
}

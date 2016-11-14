//
//  NewVirtualPeripheralController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/7.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class NewVirtualPeripheralController : UITableViewController {
    
    fileprivate let virtualPeripheralNames = ["Alert Notification", "Blood Pressure", "Cycling Power", "Cycling Speed and Cadence", "Find Me", "Glucose", "HID OVER GATT", "Hleath Thermometer", "Heart Rate", "Location and Navigation", "Phone Alert Status", "Polar HR Sensor", "Proximity", "Running Speed and Cadence", "Scan Parameters", "Temperature Alarm Service", "Time"]
    
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
    @IBAction func cancelClick(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Delegate
    // MARK: UITableViewDelegate & UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return virtualPeripheralNames.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "newVirtualPeripheralCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "newVirtualPeripheralCell")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = virtualPeripheralNames[(indexPath as NSIndexPath).row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAtIndexPath, row:\((indexPath as NSIndexPath).row)")
    }
}

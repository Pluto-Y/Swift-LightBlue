//
//  CharacteristicController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/26.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth


class CharacteristicController : UIViewController, UITableViewDelegate, UITableViewDataSource, BluetoothDelegate {
    
    var bluetoothManager : BluetoothManager = BluetoothManager.getInstance()
    var characteristic : CBCharacteristic?
    var properties : [String]?
    var headerTitles = [String]()
    var timeAndValues = [String: String]()
    var times = [String]()
    
    @IBOutlet var peripheralNameLbl: UILabel!
    @IBOutlet var characteristicNameLbl: UILabel!
    @IBOutlet var characteristicUUIDLbl: UILabel!
    @IBOutlet var peripheralStatusLbl: UILabel!
    @IBOutlet var characteristicInfosTb: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAll()
    }
    
    // MARK: Custom functions
    /// Initialize function of this controller
    private func initAll() {
        assert(characteristic != nil, "The Characteristic CAN'T be nil")
        self.title = characteristic?.name
        bluetoothManager.delegate = self
        bluetoothManager.discoverDescriptor(characteristic!)
        peripheralNameLbl.text = bluetoothManager.connectedPeripheral?.name
        characteristicNameLbl.text = characteristic!.name
        characteristicUUIDLbl.text = characteristic!.UUID.UUIDString
        
        /// According to the properties create the header title array
        var headerTitle = ""
        properties = characteristic!.getProperties()
        if properties!.contains("Read") {
            headerTitle = "READ"
            if properties!.contains("Notify") {
                headerTitle += "/NOTIFIED VALUES"
            } else if properties!.contains("Indicate") {
                headerTitle += "/INDICATED VALUES"
            }
        } else {
            if properties!.contains("Notify") {
                headerTitle += "NOTIFIED VALUES"
            } else if properties!.contains("Indicate") {
                headerTitle += "INDICATED VALUES"
            }
        }
        headerTitles.append(headerTitle)
        headerTitle = ""
        if properties!.contains("Write") || properties!.contains("Write Without Response") {
            headerTitles.append("WRITTEN VALUES")
        }
        /// But the Descriptiors and Properties always be there
        headerTitles.append("DESCRIPTORS")
        headerTitles.append("PROPERTIES")
        
    }
    
    private func reloadTableView() {
        characteristicInfosTb.reloadData()
        
        // Fix the contentSize.height is greater than frame.size.height bug(Approximately 20 unit)
        tableViewHeight.constant = characteristicInfosTb.contentSize.height
    }
    
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == headerTitles.count - 1 { // Last group is the properies
            return properties!.count
        } else if section == headerTitles.count - 2 { //Last group but one is the descriptors
            if let descriptor = characteristic!.descriptors {
                return descriptor.count
            }
        } else if headerTitles[section].hasPrefix("READ") || headerTitles[section].hasSuffix("VALUES") {
            return timeAndValues.keys.count + 1
        } else if headerTitles[section] == "WRITTEN VALUES" {
            return 1
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if headerTitles[indexPath.section] == "WRITTEN VALUES" {
            var cell = tableView.dequeueReusableCellWithIdentifier("characteristic2Btn") as? Characteristic2BtnsCell
            if cell == nil {
                let array = NSBundle.mainBundle().loadNibNamed("Characteristic2BtnsCell", owner: self, options: nil)
                cell = array.first as? Characteristic2BtnsCell
                cell?.selectionStyle = .None
            }
            cell?.leftBtn.hidden = false
            cell?.rightBtn.hidden = true
            if bluetoothManager.connected {
                cell?.enableBtns()
            } else {
                cell?.disableBtns()
            }
            cell?.leftBtn.setTitle("Write new value", forState: .Normal)
            cell?.setLeftAction({ () -> () in
                print("Write new value")
                let controller = EditValueController()
                self.navigationController?.pushViewController(controller, animated: true)
            })
            return cell!
        } else if headerTitles[indexPath.section].rangeOfString("READ") != nil || headerTitles[indexPath.section].rangeOfString("VALUES") != nil{
            if indexPath.row == 0 {
                var cell = tableView.dequeueReusableCellWithIdentifier("characteristic2Btn") as? Characteristic2BtnsCell
                if cell == nil {
                    let array = NSBundle.mainBundle().loadNibNamed("Characteristic2BtnsCell", owner: self, options: nil)
                    cell = array.first as? Characteristic2BtnsCell
                    cell?.selectionStyle = .None
                }
                if bluetoothManager.connected {
                    cell?.enableBtns()
                } else {
                    cell?.disableBtns()
                }
                if headerTitles[indexPath.section].rangeOfString("READ") != nil {
                    cell?.leftBtn.hidden = false
                    cell?.leftBtn.setTitle("Read again", forState: .Normal)
                    cell?.setLeftAction({ () -> () in
                        print("Read again")
                        self.bluetoothManager.readValueForCharacteristic(self.characteristic!)
                    })
                } else {
                    cell?.leftBtn.hidden = true
                }
                if headerTitles[indexPath.section].rangeOfString("VALUES") != nil {
                    cell?.rightBtn.hidden = false
                    cell?.rightBtn.setTitle("Listen for notifications", forState: .Normal)
                    cell?.setRightAction({ () -> () in
                        print("Listen for notifications")
                    })
                } else {
                    cell?.rightBtn.hidden = true
                }
                return cell!
            } else {
                var cell = tableView.dequeueReusableCellWithIdentifier("characteristicCell")
                if cell == nil {
                    cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "characteristicCell")
                    cell?.selectionStyle = .None
                }
                cell?.textLabel?.text = timeAndValues[times[indexPath.row - 1]]
                if timeAndValues[times[indexPath.row - 1]] != "No value" {
                    cell?.detailTextLabel?.text = times[indexPath.row - 1]
                }
                return cell!
            }
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier("characteristicCell")
            if cell == nil {
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "characteristicCell")
                cell?.selectionStyle = .None
            }
            if indexPath.section == headerTitles.count - 1 {
                cell?.textLabel?.text = properties![indexPath.row]
            } else if indexPath.section == headerTitles.count - 2 {
                if let descriptor = characteristic!.descriptors {
                    cell?.textLabel?.text = descriptor[indexPath.row].UUID.description
                }
                
            }
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let lbl = UILabel()
        lbl.frame = CGRectMake(10, 0, UIScreen.mainScreen().bounds.size.width - 20, 30)
        lbl.text = headerTitles[section]
        view.addSubview(lbl)
        return view
    }
    
    // MARK: BluetoothDelegate
    func didDisconnectPeripheral(peripheral: CBPeripheral) {
        print("CharacteristicController --> didDisconnectPeripheral")
        peripheralStatusLbl.text = "Disconnected. Data is Stale."
        peripheralStatusLbl.textColor = UIColor.redColor()
        AlertUtil.showCancelAlert("Disconnected Alert", message: "The peripheral has disconnected", cancelTitle: "Dismiss", viewController: self)
    }
    
    func didDiscoverDescriptors(characteristic: CBCharacteristic) {
        print("CharacteristicController --> didDiscoverDescriptors")
        self.characteristic = characteristic
        reloadTableView()
    }
    
    func didReadValueForCharacteristic(characteristic: CBCharacteristic) {
        print("CharacteristicController --> didReadValueForCharacteristic")
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        let timeStr = formatter.stringFromDate(NSDate())
        if characteristic.value != nil && characteristic.value!.length != 0 {
            let data = characteristic.value!
            let rangeOfData = Range(start: data.description.startIndex.advancedBy(1), end: data.description.endIndex.predecessor())
            timeAndValues[timeStr] = "0x" + data.description.substringWithRange(rangeOfData)
        } else {
            timeAndValues[timeStr] = "No value"
        }
        times.append(timeStr)
        reloadTableView()
    }
}

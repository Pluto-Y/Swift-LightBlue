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
    fileprivate var isListening = false
    
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
    fileprivate func initAll() {
        assert(characteristic != nil, "The Characteristic CAN'T be nil")
        self.title = characteristic?.name
        bluetoothManager.delegate = self
        bluetoothManager.discoverDescriptor(characteristic!)
        peripheralNameLbl.text = bluetoothManager.connectedPeripheral?.name
        characteristicNameLbl.text = characteristic!.name
        characteristicUUIDLbl.text = characteristic!.uuid.uuidString
        
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
    
    fileprivate func reloadTableView() {
        characteristicInfosTb.reloadData()
        
        // Fix the contentSize.height is greater than frame.size.height bug(Approximately 20 unit)
        tableViewHeight.constant = characteristicInfosTb.contentSize.height
    }
    
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if headerTitles[(indexPath as NSIndexPath).section] == "WRITTEN VALUES" {
            var cell = tableView.dequeueReusableCell(withIdentifier: "characteristic2Btn") as? Characteristic2BtnsCell
            if cell == nil {
                let array = Bundle.main.loadNibNamed("Characteristic2BtnsCell", owner: self, options: nil)
                cell = array?.first as? Characteristic2BtnsCell
                cell?.selectionStyle = .none
            }
            cell?.leftBtn.isHidden = false
            cell?.rightBtn.isHidden = true
            if bluetoothManager.connected {
                cell?.enableBtns()
            } else {
                cell?.disableBtns()
            }
            cell?.leftBtn.setTitle("Write new value", for: UIControlState())
            cell?.setLeftAction({ () -> () in
                print("Write new value")
                let controller = EditValueController()
                controller.characteristic = self.characteristic!
                if self.characteristic!.getProperties().contains("Write Without Response") {
                    controller.writeType = .withoutResponse
                } else {
                    controller.writeType = .withResponse
                }
                self.navigationController?.pushViewController(controller, animated: true)
            })
            return cell!
        } else if headerTitles[(indexPath as NSIndexPath).section].range(of: "READ") != nil || headerTitles[(indexPath as NSIndexPath).section].range(of: "VALUES") != nil{
            if (indexPath as NSIndexPath).row == 0 {
                var cell = tableView.dequeueReusableCell(withIdentifier: "characteristic2Btn") as? Characteristic2BtnsCell
                if cell == nil {
                    let array = Bundle.main.loadNibNamed("Characteristic2BtnsCell", owner: self, options: nil)
                    cell = array?.first as? Characteristic2BtnsCell
                    cell?.selectionStyle = .none
                }
                if bluetoothManager.connected {
                    cell?.enableBtns()
                } else {
                    cell?.disableBtns()
                }
                if headerTitles[(indexPath as NSIndexPath).section].range(of: "READ") != nil {
                    cell?.leftBtn.isHidden = false
                    cell?.leftBtn.setTitle("Read again", for: UIControlState())
                    cell?.setLeftAction({ () -> () in
                        print("Read again")
                        self.bluetoothManager.readValueForCharacteristic(characteristic: self.characteristic!)
                    })
                } else {
                    cell?.leftBtn.isHidden = true
                }
                if headerTitles[(indexPath as NSIndexPath).section].range(of: "VALUES") != nil {
                    cell?.rightBtn.isHidden = false
                    if !isListening {
                        cell?.rightBtn.setTitle("Listen for notifications", for: UIControlState())
                    } else {
                        cell?.rightBtn.setTitle("Stop listening", for: UIControlState())
                    }
                    cell?.setRightAction({ () -> () in
                        print("Listen for notifications")
                        self.isListening = !self.isListening
                        if !self.isListening {
                            cell?.rightBtn.setTitle("Listen for notifications", for: UIControlState())
                        } else {
                            cell?.rightBtn.setTitle("Stop listening", for: UIControlState())
                        }
                        self.bluetoothManager.setNotification(enable: self.isListening, forCharacteristic: self.characteristic!)
                    })
                } else {
                    cell?.rightBtn.isHidden = true
                }
                return cell!
            } else {
                var cell = tableView.dequeueReusableCell(withIdentifier: "characteristicCell")
                if cell == nil {
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "characteristicCell")
                    cell?.selectionStyle = .none
                }
                cell?.textLabel?.text = timeAndValues[times[(indexPath as NSIndexPath).row - 1]]
                if timeAndValues[times[(indexPath as NSIndexPath).row - 1]] != "No value" {
                    cell?.detailTextLabel?.text = times[(indexPath as NSIndexPath).row - 1]
                }
                return cell!
            }
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: "characteristicCell")
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "characteristicCell")
                cell?.selectionStyle = .none
            }
            if (indexPath as NSIndexPath).section == headerTitles.count - 1 {
                cell?.textLabel?.text = properties![(indexPath as NSIndexPath).row]
            } else if (indexPath as NSIndexPath).section == headerTitles.count - 2 {
                if let descriptor = characteristic!.descriptors {
                    cell?.textLabel?.text = descriptor[(indexPath as NSIndexPath).row].uuid.description
                }
                
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let lbl = UILabel()
        lbl.frame = CGRect(x: 10, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 30)
        lbl.text = headerTitles[section]
        view.addSubview(lbl)
        return view
    }
    
    // MARK: BluetoothDelegate
    func didDisconnectPeripheral(_ peripheral: CBPeripheral) {
        print("CharacteristicController --> didDisconnectPeripheral")
        peripheralStatusLbl.text = "Disconnected. Data is Stale."
        peripheralStatusLbl.textColor = UIColor.red
    }
    
    func didDiscoverDescriptors(_ characteristic: CBCharacteristic) {
        print("CharacteristicController --> didDiscoverDescriptors")
        self.characteristic = characteristic
        reloadTableView()
    }
    
    func didReadValueForCharacteristic(_ characteristic: CBCharacteristic) {
        print("CharacteristicController --> didReadValueForCharacteristic")
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        let timeStr = formatter.string(from: Date())
        if characteristic.value != nil && characteristic.value!.count != 0 {
            let data = characteristic.value!
            let rangeOfData = (data.description.characters.index(data.description.startIndex, offsetBy: 1) ..< data.description.characters.index(before: data.description.endIndex))
            timeAndValues[timeStr] = "0x" + data.description.substring(with: rangeOfData)
        } else {
            timeAndValues[timeStr] = "No value"
        }
        times.append(timeStr)
        reloadTableView()
    }
}

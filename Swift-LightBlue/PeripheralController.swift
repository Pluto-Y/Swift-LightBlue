//
//  PeripheralController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/11.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth 

class PeripheralController : UIViewController, UITableViewDelegate, UITableViewDataSource, BluetoothDelegate {
    
    private let bluetoothManager = BluetoothManager.getInstance()
    private var showAdvertisementData = false
    private var services : [CBService]?
    private var characteristicsDic = [CBUUID : [CBCharacteristic]]()
    
    var lastAdvertisementData : Dictionary<String, AnyObject>?
    private var advertisementDataKeys : [String]?
    
    @IBOutlet var peripheralNameLbl: UILabel!
    @IBOutlet var peripheralUUIDLbl: UILabel!
    @IBOutlet var connectFlagLbl: UILabel!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var dataTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bluetoothManager.delegate = self
    }
    
    // MARK: custom functions
    func initAll() {
        self.title = "Peripheral"
        advertisementDataKeys = ([String](lastAdvertisementData!.keys)).sort()
        bluetoothManager.discoverCharacteristics()
        services = bluetoothManager.connectedPeripheral?.services
        peripheralNameLbl.text = bluetoothManager.connectedPeripheral?.name
        peripheralUUIDLbl.text = bluetoothManager.connectedPeripheral?.identifier.UUIDString
        reloadTableView()
    }
    
    /**
     The callback function of the Show Advertisement Data button click
     */
    func showAdvertisementDataBtnClick() {
        print("PeripheralController --> showAdvertisementDataBtnClick")
        showAdvertisementData = !showAdvertisementData
        reloadTableView()
    }
    
    /**
     Reload tableView
     */
    func reloadTableView() {
        dataTableView.reloadData()
        
        // Fix the contentSize.height is greater than frame.size.height bug(Approximately 20 unit)
        tableViewHeight.constant = dataTableView.contentSize.height
    }
    
    /**
     According the characteristic property array get the properties string
     
     - parameter array: characteristic property array
     
     - returns: properties string
     */
    func getPropertiesFromArray(array : [String]) -> String {
        var propertiesString = "Properties:"
        let containWrite = array.contains("Write")
        for property in array {
            if containWrite && property == "Write Without Response" {
                continue
            }
            propertiesString += " " + property
        }
        return propertiesString
    }
    
    
    // MARK: Delegate
    // Mark: UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if showAdvertisementData {
                return advertisementDataKeys!.count
            } else {
                return 0
            }
        }
        let characteristics = characteristicsDic[services![section - 1].UUID]
        return characteristics == nil ? 0 : characteristics!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("numberOfSectionsInTableView:\(bluetoothManager.connectedPeripheral!.services!.count + 1)")
        return bluetoothManager.connectedPeripheral!.services!.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("serviceCell")
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "serviceCell")
            cell?.selectionStyle = .None
            cell?.accessoryType = .DisclosureIndicator
        }
        if indexPath.section == 0 {
            cell?.textLabel?.text = CBAdvertisementData.getAdvertisementDataStringValue(lastAdvertisementData!, key: advertisementDataKeys![indexPath.row])
            cell?.textLabel?.adjustsFontSizeToFitWidth = true
            
            cell?.detailTextLabel?.text = CBAdvertisementData.getAdvertisementDataName(advertisementDataKeys![indexPath.row])
        } else {
            let characteristic = characteristicsDic[services![indexPath.section - 1].UUID]![indexPath.row]
            cell?.textLabel?.text = characteristic.name
            cell?.detailTextLabel?.text = getPropertiesFromArray(characteristic.getProperties())
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print("section:\(section)")
        let view = UIView(frame: CGRectMake(0, 0, 0, 0))
        view.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        
        let serviceNameLbl = UILabel(frame: CGRectMake(10, 20, UIScreen.mainScreen().bounds.size.width - 100, 20))
        serviceNameLbl.font = UIFont.systemFontOfSize(20, weight: UIFontWeightMedium)
        
        view.addSubview(serviceNameLbl)
        
        if section == 0 {
            serviceNameLbl.text = "ADVERTISEMENT DATA"
            let showBtn = UIButton(type: .System)
            showBtn.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width - 80, 20, 60, 20)
            if showAdvertisementData {
                showBtn.setTitle("Hide", forState: .Normal)
            } else {
                showBtn.setTitle("Show", forState: .Normal)
            }

            showBtn.addTarget(self, action: Selector("showAdvertisementDataBtnClick"), forControlEvents: .TouchUpInside)
            view.addSubview(showBtn)
        } else {
            let service = bluetoothManager.connectedPeripheral!.services![section - 1]
            serviceNameLbl.text = service.name
        }
        
        return view
    }
    
    // Need overide this method for fix start section from 1(not 0) in the method 'tableView:viewForHeaderInSection:' after iOS 7
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            
        } else {
            print("Click at section: \(indexPath.section), row: \(indexPath.row)")
            let controller = CharacteristicController()
            controller.characteristic = characteristicsDic[services![indexPath.section - 1].UUID]![indexPath.row]
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: BluetoothDelegate
    func didDisconnectPeripheral(peripheral: CBPeripheral) {
        print("PeripheralController --> didDisconnectPeripheral")
        connectFlagLbl.text = "Disconnected. Data is Stale."
        connectFlagLbl.textColor = UIColor.redColor()
        AlertUtil.showCancelAlert("Disconnected Alert", message: "The peripheral has disconnected", cancelTitle: "Dismiss", viewController: self)
        
    }
    
    func didDiscoverCharacteritics(service: CBService) {
        print("Service.characteristics:\(service.characteristics)")
        characteristicsDic[service.UUID] = service.characteristics
        reloadTableView()
    }
    
}

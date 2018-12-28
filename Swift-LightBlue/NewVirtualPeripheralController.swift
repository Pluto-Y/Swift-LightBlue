//
//  NewVirtualPeripheralController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/7.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth

class NewVirtualPeripheralController : UITableViewController {
    
    fileprivate let cellReuseIdentifier = "VirtualPeripheralCell"
    fileprivate weak var saveBarButtonItem: UIBarButtonItem?
    fileprivate let peripherals: [VirtualPeripheral] = [.blankPeripheral, .alertNotificationPeripheral, .bloodPressurePeripheral, .cyclingPowerPeripheral, .cyclingSpeedAndCadencePeripheral, .findMePeripheral, .glucosePeripheral, .HIDOVERGATTPeripheral, .healthThermometerPeripheral, .heartRatePeripheral, .locationAndNavigationPeripheral, .phoneAlertStatusPeripheral, .polarHRSensorPeripheral, .proximityPeripheral, .runningSpeedAndCadencePeripheral, .scanParametersPeripheral, .temperatureAlarmServicePeripheral, .timePeripheral]
    fileprivate var selectedIndex: Int? {
        didSet {
            self.saveBarButtonItem?.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAll()
    }
    
    // MARK: Custom functions
    func initAll() {
        // init prompt without animation and let the navigationBar do not overlap with uitableview
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        saveBarButtonItem = navigationItem.rightBarButtonItem
        saveBarButtonItem?.isEnabled = false
    }
    
    // MARK: Callback functions
    @IBAction func cancelClick(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveClick(_ sender: Any) {
        guard let selectedIndex = selectedIndex else {
            return;
        }
        VirtualPeripheralStore.shared.add(virtualPeripheral: peripherals[selectedIndex])
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Delegate
    // MARK: UITableViewDelegate & UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = peripherals[indexPath.row].name
        
        if selectedIndex == indexPath.row {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAtIndexPath, row:\(indexPath.row)")
        selectedIndex = indexPath.row
        tableView.reloadData()
    }
}

//
//  ViewController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/1.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth
import QuartzCore
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource, BluetoothDelegate {
    
    let bluetoothManager = BluetoothManager.getInstance()
    var connectingView : ConnectingView?
    var nearbyPeripherals : [CBPeripheral] = []
    var nearbyPeripheralInfos : [CBPeripheral:Dictionary<String, AnyObject>] = [CBPeripheral:Dictionary<String, AnyObject>]()
    @IBOutlet var peripheralsTb: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // If is return from NewVirtualPeripheralController, it should reload the navigationBar
        // It's used to avoid occuring some wrong when return back.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        if bluetoothManager.connectedPeripheral != nil {
            bluetoothManager.disconnectPeripheral()
        }
        bluetoothManager.delegate = self
    }
    
    // MARK: custom funcstions
    func initAll() {
        print("MainController --> initAll")
        self.title = "LightBlue"
    }

    // MARK: callback functions
    /**
     Info bar btn item click
     */
    @IBAction func infoClick(_ sender: AnyObject) {
        print("MainController --> infoClick")
    }
    
    // MARK: Delegates
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peripheral = nearbyPeripherals[(indexPath as NSIndexPath).row]
        connectingView = ConnectingView.showConnectingView()
        connectingView?.tipNameLbl.text = peripheral.name
        bluetoothManager.connectPeripheral(peripheral)
        bluetoothManager.stopScanPeripheral()
    }
    
    // MARK： UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath as NSIndexPath).section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyPeripheralCell") as? NearbyPeripheralCell
            let peripheral = nearbyPeripherals[(indexPath as NSIndexPath).row]
            let peripheralInfo = nearbyPeripheralInfos[peripheral]
            
            cell?.yPeripheralNameLbl.text = peripheral.name == nil || peripheral.name == ""  ? "Unnamed" : peripheral.name
            
            let serviceUUIDs = peripheralInfo!["advertisementData"]!["kCBAdvDataServiceUUIDs"] as? NSArray
            if serviceUUIDs != nil && serviceUUIDs?.count != 0 {
                cell?.yServiceCountLbl.text = "\((serviceUUIDs?.count)!) service" + (serviceUUIDs?.count > 1 ? "s" : "")
            } else {
                cell?.yServiceCountLbl.text = "No service"
            }
            
            // The signal strength img icon and the number of signal strength
            let RSSI = peripheralInfo!["RSSI"]! as! NSNumber
            cell?.ySignalStrengthLbl.text = "\(RSSI)"
            switch labs(RSSI.intValue) {
            case 0...40:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_5")
            case 41...53:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_4")
            case 54...65:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_3")
            case 66...77:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_2")
            case 77...89:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_1")
            default:
                cell?.ySignalStrengthImg.image = UIImage(named: "signal_strength_0")
            }
            return cell!
        } else {
            return UITableViewCell()
        }
    }
    
    // The tableview group header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: 0))
        
        let lblTitle = UILabel(frame: CGRect(x: 20, y: 2, width: 120, height: 21))
        lblTitle.font = UIFont.boldSystemFont(ofSize: 12)

        if section == 0 {
            lblTitle.text = "Peripherals Nearby"
            headerView.backgroundColor = UIColor.white
        } else {
            lblTitle.text = "Virtual Peripherals"
            headerView.backgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1)
        }
        headerView.addSubview(lblTitle)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nearbyPeripherals.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: BluetoothDelegate 
    func didDiscoverPeripheral(_ peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        if !nearbyPeripherals.contains(peripheral) {
            nearbyPeripherals.append(peripheral)
            nearbyPeripheralInfos[peripheral] = ["RSSI": RSSI, "advertisementData": advertisementData as AnyObject]
        } else {
            nearbyPeripheralInfos[peripheral]!["RSSI"] = RSSI
            nearbyPeripheralInfos[peripheral]!["advertisementData"] = advertisementData as AnyObject?
        }
        peripheralsTb.reloadData()
    }
    
    /**
     The bluetooth state monitor
     
     - parameter state: The bluetooth state
     */
    func didUpdateState(_ state: CBCentralManagerState) {
        print("MainController --> didUpdateState:\(state)")
        switch state {
        case .resetting:
            print("MainController --> State : Resetting")
        case .poweredOn:
            bluetoothManager.startScanPeripheral()
            UnavailableView.hideUnavailableView()
        case .poweredOff:
            print(" MainController -->State : Powered Off")
            fallthrough
        case .unauthorized:
            print("MainController --> State : Unauthorized")
            fallthrough
        case .unknown:
            print("MainController --> State : Unknown")
            fallthrough
        case .unsupported:
            print("MainController --> State : Unsupported")
            bluetoothManager.stopScanPeripheral()
            bluetoothManager.disconnectPeripheral()
            ConnectingView.hideConnectingView()
            UnavailableView.showUnavailableView()
            
        }
    }
    
    /**
     The callback function when central manager connected the peripheral successfully.
     
     - parameter connectedPeripheral: The peripheral which connected successfully.
     */
    func didConnectedPeripheral(_ connectedPeripheral: CBPeripheral) {
        print("MainController --> didConnectedPeripheral")
        connectingView?.tipLbl.text = "Interrogating..."
    }
    
    /**
     The peripheral services monitor
     
     - parameter services: The service instances which discovered by CoreBluetooth
     */
    func didDiscoverServices(_ peripheral: CBPeripheral) {
        print("MainController --> didDiscoverService:\(peripheral.services)")
        ConnectingView.hideConnectingView()
        let peripheralController = PeripheralController()
        let peripheralInfo = nearbyPeripheralInfos[peripheral]
        peripheralController.lastAdvertisementData = peripheralInfo!["advertisementData"] as? Dictionary<String, AnyObject>
        self.navigationController?.pushViewController(peripheralController, animated: true)
    }
    
    /**
     The method invoked when interrogated fail.
     
     - parameter peripheral: The peripheral which interrogation failed.
     */
    func didFailedToInterrogate(_ peripheral: CBPeripheral) {
        ConnectingView.hideConnectingView()
        AlertUtil.showCancelAlert("Connection Alert", message: "The perapheral disconnected while being interrogated.", cancelTitle: "Dismiss", viewController: self)
    }
    
}


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
    
    fileprivate class PeripheralInfos: Equatable, Hashable {
        let peripheral: CBPeripheral
        var RSSI: Int = 0
        var advertisementData: [String: Any] = [:]
        var lastUpdatedTimeInterval: TimeInterval
        
        init(_ peripheral: CBPeripheral) {
            self.peripheral = peripheral
            self.lastUpdatedTimeInterval = Date().timeIntervalSince1970
        }
        
        static func == (lhs: PeripheralInfos, rhs: PeripheralInfos) -> Bool {
            return lhs.peripheral.isEqual(rhs.peripheral)
        }
        
        var hashValue: Int {
            return peripheral.hash
        }
    }
    
    let bluetoothManager = BluetoothManager.getInstance()
    var connectingView: ConnectingView?
    fileprivate var nearbyPeripheralInfos: [PeripheralInfos] = []
//    var nearbyPeripherals: [CBPeripheral] = []
//    var nearbyPeripheralInfos: [CBPeripheral:Dictionary<String, AnyObject>] = [CBPeripheral:Dictionary<String, AnyObject>]()
    var cachedVirtualPeripherals: [VirtualPeripheral] {
        return VirtualPeripheralStore.shared.cachedVirtualPeripheral
    }
    var preferences: Preferences? {
        return PreferencesStore.shared.preferences
    }
    var selectedVirtualPeriperalIndex: Int = -1
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
        nearbyPeripheralInfos.removeAll()
        if bluetoothManager.connectedPeripheral != nil {
            bluetoothManager.disconnectPeripheral()
        }
        bluetoothManager.delegate = self
        
        peripheralsTb.reloadData()
    }
    
    // MARK: custom funcstions
    func initAll() {
        print("MainController --> initAll")
        self.title = "LightBlue"
    }

    // MARK: callback functions
    /**
     Sort bar btn item click
     */
    @IBAction func sortClick(_ sender: AnyObject) {
        print("MainController --> sortClick")
    }
    
    // MARK: Delegates
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let peripheral = nearbyPeripheralInfos[indexPath.row].peripheral
            connectingView = ConnectingView.showConnectingView()
            connectingView?.tipNameLbl.text = peripheral.name
            bluetoothManager.connectPeripheral(peripheral)
            bluetoothManager.stopScanPeripheral()
        } else if indexPath.section == 1 {
            if indexPath.row == cachedVirtualPeripherals.count {
                present(UINavigationController(rootViewController: NewVirtualPeripheralController()), animated: true, completion: nil)
            } else {
                selectedVirtualPeriperalIndex = indexPath.row
                peripheralsTb.reloadData()
            }
        }
    }
    
    // MARK： UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyPeripheralCell") as? NearbyPeripheralCell
            let peripheralInfo = nearbyPeripheralInfos[indexPath.row]
            let peripheral = peripheralInfo.peripheral
            
            
            cell?.yPeripheralNameLbl.text = peripheral.name == nil || peripheral.name == ""  ? "Unnamed" : peripheral.name
            
            if let serviceUUIDs = peripheralInfo.advertisementData["kCBAdvDataServiceUUIDs"] as? NSArray, serviceUUIDs.count != 0 {
                cell?.yServiceCountLbl.text = "\(serviceUUIDs.count) service" + (serviceUUIDs.count > 1 ? "s" : "")
            } else {
                cell?.yServiceCountLbl.text = "No service"
            }
            
            // The signal strength img icon and the number of signal strength
            let RSSI = peripheralInfo.RSSI
            cell?.ySignalStrengthLbl.text = "\(RSSI)"
            switch labs(RSSI) {
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
        } else if indexPath.section == 1 {
            if indexPath.row != cachedVirtualPeripherals.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VirtualPeripheralCell") as? VirtualPeripheralCell
                if indexPath.row != cachedVirtualPeripherals.count {
                    let virtualPeripheral = cachedVirtualPeripherals[indexPath.row]
                    cell?.checkIconImageView.image = indexPath.row == selectedVirtualPeriperalIndex ? UIImage(named: "icon_checked") : UIImage(named: "icon_uncheck")
                    cell?.nameLabel.text = virtualPeripheral.name
                    let suffix = virtualPeripheral.services.count <= 1 ? "Service" : "Services"
                    cell?.serviceLabel.text = "\(virtualPeripheral.services.count) \(suffix)"
                }
                return cell!
            } else {
                return tableView.dequeueReusableCell(withIdentifier: "NewPeripheralCell") as! NewPeripheralCell
            }
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
            return nearbyPeripheralInfos.count
        } else if section == 1 {
            return cachedVirtualPeripherals.count + 1
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: BluetoothDelegate 
    func didDiscoverPeripheral(_ peripheral: CBPeripheral, advertisementData: [String : Any], RSSI: NSNumber) {
        let peripheralInfo = PeripheralInfos(peripheral)
        if !nearbyPeripheralInfos.contains(peripheralInfo) {
            if let preference = preferences, preference.needFilter {
                if RSSI.intValue != 127, RSSI.intValue > preference.filter {
                    peripheralInfo.RSSI = RSSI.intValue
                    peripheralInfo.advertisementData = advertisementData
                    nearbyPeripheralInfos.append(peripheralInfo)
                }
            } else {
                peripheralInfo.RSSI = RSSI.intValue
                peripheralInfo.advertisementData = advertisementData
                nearbyPeripheralInfos.append(peripheralInfo)
            }
        } else {
            guard let index = nearbyPeripheralInfos.firstIndex(of: peripheralInfo) else {
                return
            }
            
            let originPeripheralInfo = nearbyPeripheralInfos[index]
            let nowTimeInterval = Date().timeIntervalSince1970
            
            // If the last update within one second, then ignore it
            guard nowTimeInterval - originPeripheralInfo.lastUpdatedTimeInterval >= 1.0 else {
                return
            }
            
            originPeripheralInfo.lastUpdatedTimeInterval = nowTimeInterval
            originPeripheralInfo.RSSI = RSSI.intValue
            originPeripheralInfo.advertisementData = advertisementData
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
//            UnavailableView.showUnavailableView()
            
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
        print("MainController --> didDiscoverService:\(peripheral.services?.description ?? "Unknow Service")")
        
        let tmp = PeripheralInfos(peripheral)
        guard let index = nearbyPeripheralInfos.firstIndex(of: tmp) else {
            return
        }
        ConnectingView.hideConnectingView()
        let peripheralController = PeripheralController()
        let peripheralInfo = nearbyPeripheralInfos[index]
        peripheralController.lastAdvertisementData = peripheralInfo.advertisementData
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


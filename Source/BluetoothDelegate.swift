//
//  BluetoothDelegate.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/11.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

/**
 *  Bluetooth Model Delegate
 */
@objc public protocol BluetoothDelegate : NSObjectProtocol {
    /**
     The callback function when the bluetooth has updated.
     
     - parameter state: The newest state
     */
    @objc optional func didUpdateState(_ state: CBCentralManagerState)
    
    /**
     The callback function when peripheral has been found.
     
     - parameter peripheral:        The peripheral has been found.
     - parameter advertisementData: The advertisement data.
     - parameter RSSI:              The signal strength.
     */
    @objc optional func didDiscoverPeripheral(_ peripheral: CBPeripheral, advertisementData: [String : Any], RSSI: NSNumber)
    
    /**
     The callback function when central manager connected the peripheral successfully.
     
     - parameter connectedPeripheral: The peripheral which connected successfully.
     */
    @objc optional func didConnectedPeripheral(_ connectedPeripheral: CBPeripheral)
    
    /**
     The callback function when central manager failed to connect the peripheral.
     
     - parameter connectedPeripheral: The peripheral which connected failure.
     - parameter error:               The connected failed error message.
     */
    @objc optional func failToConnectPeripheral(_ peripheral: CBPeripheral, error: Error)
    
    /**
     The callback function when the services has been discovered.
     
     - parameter peripheral: Peripheral which provide this information and contain services information
     */
    @objc optional func didDiscoverServices(_ peripheral: CBPeripheral)
    
    /**
    The callback function when the peripheral disconnected.
    
    - parameter peripheral: The peripheral which provide this action
    */
    @objc optional func didDisconnectPeripheral(_ peripheral: CBPeripheral)
    
    /**
     The callback function when interrogate the peripheral is timeout
     
     - parameter peripheral: The peripheral which is failed to discover service
     */
    @objc optional func didFailedToInterrogate(_ peripheral: CBPeripheral)
    
    /**
     The callback function when discover characteritics successfully.
     
     - parameter service: The service information include characteritics.
     */
    @objc optional func didDiscoverCharacteritics(_ service: CBService)
    
    /**
     The callback function when peripheral failed to discover charateritics.
     
     - parameter error: The error information.
     */
    @objc optional func didFailToDiscoverCharacteritics(_ error: Error)
    
    /**
     The callback function when discover descriptor for characteristic successfully
     
     - parameter characteristic: The characteristic which has the descriptor
     */
    @objc optional func didDiscoverDescriptors(_ characteristic: CBCharacteristic)
    
    /**
     The callback function when failed to discover descriptor for characteristic
     
     - parameter error: The error message
     */
    @objc optional func didFailToDiscoverDescriptors(_ error: Error)
    
    /**
     The callback function invoked when peripheral read value for the characteristic successfully
     
     - parameter characteristic: The characteristic withe the value
     */
    @objc optional func didReadValueForCharacteristic(_ characteristic: CBCharacteristic)
    
    /**
     The callback function invoked when failed to read value for the characteristic
     
     - parameter error: The error message
     */
    @objc optional func didFailToReadValueForCharacteristic(_ error: Error)
}

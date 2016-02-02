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
    optional func didUpdateState(state: CBCentralManagerState)
    
    /**
     The callback function when peripheral has been found.
     
     - parameter peripheral:        The peripheral has been found.
     - parameter advertisementData: The advertisement data.
     - parameter RSSI:              The signal strength.
     */
    optional func didDiscoverPeripheral(peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber)
    
    /**
     The callback function when central manager connected the peripheral successfully.
     
     - parameter connectedPeripheral: The peripheral which connected successfully.
     */
    optional func didConnectedPeripheral(connectedPeripheral: CBPeripheral)
    
    /**
     The callback function when central manager failed to connect the peripheral.
     
     - parameter connectedPeripheral: The peripheral which connected failure.
     - parameter error:               The connected failed error message.
     */
    optional func failToConnectPeripheral(peripheral: CBPeripheral, error: NSError)
    
    /**
     The callback function when the services has been discovered.
     
     - parameter peripheral: Peripheral which provide this information and contain services information
     */
    optional func didDiscoverServices(peripheral: CBPeripheral)
    
    /**
    The callback function when the peripheral disconnected.
    
    - parameter peripheral: The peripheral which provide this action
    */
    optional func didDisconnectPeripheral(peripheral: CBPeripheral)
    
    /**
     The callback function when interrogate the peripheral is timeout
     
     - parameter peripheral: The peripheral which is failed to discover service
     */
    optional func didFailedToInterrogate(peripheral: CBPeripheral)
    
    /**
     The callback function when discover characteritics successfully.
     
     - parameter service: The service information include characteritics.
     */
    optional func didDiscoverCharacteritics(service: CBService)
    
    /**
     The callback function when peripheral failed to discover charateritics.
     
     - parameter error: The error information.
     */
    optional func didFailToDiscoverCharacteritics(error: NSError)
    
    /**
     The callback function when discover descriptor for characteristic successfully
     
     - parameter characteristic: The characteristic which has the descriptor
     */
    optional func didDiscoverDescriptors(characteristic: CBCharacteristic)
    
    /**
     The callback function when failed to discover descriptor for characteristic
     
     - parameter error: The error message
     */
    optional func didFailToDiscoverDescriptors(error: NSError)
    
    /**
     The callback function invoked when peripheral read value for the characteristic successfully
     
     - parameter characteristic: The characteristic withe the value
     */
    optional func didReadValueForCharacteristic(characteristic: CBCharacteristic)
    
    /**
     The callback function invoked when failed to read value for the characteristic
     
     - parameter error: The error message
     */
    optional func didFailToReadValueForCharacteristic(error: NSError)
}

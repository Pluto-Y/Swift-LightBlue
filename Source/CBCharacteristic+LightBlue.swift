//
//  CBCharacteristicProperties+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/15.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

extension CBCharacteristic {
    
    /// Obtain the name of the characteristic according to the UUID, if the UUID is the standard defined in the `Bluetooth Developer Portal` then return the name
    public var name : String {
        if self.uuid.name != "" {
            return self.uuid.name
        } else {
            return "0x" + self.uuid.uuidString
        }
    }
    
    /**
     Obtain the properties string array according to the `self.properties`.
     */
    func getPropertiesString() -> [String] {
        var resultProperties = [String]()
        if properties.contains(.broadcast) {
            resultProperties.append("Broadcast")
        }
        if properties.contains(.read) {
            resultProperties.append("Read")
        }
        if properties.contains(.write) {
            resultProperties.append("Write")
        }
        if properties.contains(.writeWithoutResponse) {
            resultProperties.append("Write Without Response")
        }
        if properties.contains(.notify) {
            resultProperties.append("Notify")
        }
        if properties.contains(.indicate) {
            resultProperties.append("Indicate")
        }
        if properties.contains(.authenticatedSignedWrites) {
            resultProperties.append("Authenticated Signed Writes")
        }
        if properties.contains(.extendedProperties) {
            resultProperties.append("Extended Properties")
        }
        if properties.contains(.notifyEncryptionRequired) {
            resultProperties.append("Notify Encryption Required")
        }
        if properties.contains(.indicateEncryptionRequired) {
            resultProperties.append("Indicate Encryption Required")
        }
        return resultProperties
    }

}

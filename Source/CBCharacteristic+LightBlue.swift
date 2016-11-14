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
    func getProperties() -> [String] {
        let properties = self.properties.rawValue
        let broadcast = CBCharacteristicProperties.broadcast.rawValue
        let read = CBCharacteristicProperties.read.rawValue
        let writeWithoutResponse = CBCharacteristicProperties.writeWithoutResponse.rawValue
        let write = CBCharacteristicProperties.write.rawValue
        let notify = CBCharacteristicProperties.notify.rawValue
        let indicate = CBCharacteristicProperties.indicate.rawValue
        let authenticatedSignedWrites = CBCharacteristicProperties.authenticatedSignedWrites.rawValue
        let extendedProperties = CBCharacteristicProperties.extendedProperties.rawValue
        let notifyEncryptionRequired = CBCharacteristicProperties.notifyEncryptionRequired.rawValue
        let indicateEncryptionRequired = CBCharacteristicProperties.indicateEncryptionRequired.rawValue
        var resultProperties = [String]()
        if properties & broadcast > 0 {
            resultProperties.append("Broadcast")
        }
        if properties & read > 0 {
            resultProperties.append("Read")
        }
        if properties & write > 0 {
            resultProperties.append("Write")
        }
        if properties & writeWithoutResponse > 0 {
            resultProperties.append("Write Without Response")
        }
        
        if properties & notify > 0 {
            resultProperties.append("Notify")
        }
        if properties & indicate > 0 {
            resultProperties.append("Indicate")
        }
        if properties & authenticatedSignedWrites > 0 {
            resultProperties.append("Authenticated Signed Writes")
        }
        if properties & extendedProperties > 0 {
            resultProperties.append("Extended Properties")
        }
        if properties & notifyEncryptionRequired > 0 {
            resultProperties.append("Notify Encryption Required")
        }
        if properties & indicateEncryptionRequired > 0 {
            resultProperties.append("Indicate Encryption Required")
        }
        return resultProperties
    }

}

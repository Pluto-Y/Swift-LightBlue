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
        if self.UUID.name != "" {
            return self.UUID.name
        } else {
            return "0x" + self.UUID.UUIDString
        }
    }
    
    
    /**
     Obtain the properties string array according to the `self.properties`.
     */
    func getProperties() -> [String] {
        let properties = self.properties.rawValue
        let broadcast = CBCharacteristicProperties.Broadcast.rawValue
        let read = CBCharacteristicProperties.Read.rawValue
        let writeWithoutResponse = CBCharacteristicProperties.WriteWithoutResponse.rawValue
        let write = CBCharacteristicProperties.Write.rawValue
        let notify = CBCharacteristicProperties.Notify.rawValue
        let indicate = CBCharacteristicProperties.Indicate.rawValue
        let authenticatedSignedWrites = CBCharacteristicProperties.AuthenticatedSignedWrites.rawValue
        let extendedProperties = CBCharacteristicProperties.ExtendedProperties.rawValue
        let notifyEncryptionRequired = CBCharacteristicProperties.NotifyEncryptionRequired.rawValue
        let indicateEncryptionRequired = CBCharacteristicProperties.IndicateEncryptionRequired.rawValue
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

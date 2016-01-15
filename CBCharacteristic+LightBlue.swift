//
//  CBCharacteristicProperties+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/15.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

extension CBCharacteristic {
    
    /**
     Obtain the properties string  accordint to the `self.properties`.
     */
    func getPropertiesString() -> String {
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
        var propertiesString = ""
        if properties & broadcast > 0 {
            propertiesString += " Broadcast"
        }
        if properties & read > 0 {
            propertiesString += " Read"
        }
        if properties & writeWithoutResponse > 0 {
            propertiesString += " WriteWithoutResponse"
        }
        if properties & write > 0 {
            propertiesString += " Write"
        }
        if properties & notify > 0 {
            propertiesString += " Notify"
        }
        if properties & indicate > 0 {
            propertiesString += " Indicate"
        }
        if properties & authenticatedSignedWrites > 0 {
            propertiesString += " AuthenticatedSignedWrites"
        }
        if properties & extendedProperties > 0 {
            propertiesString += " ExtendedProperties"
        }
        if properties & notifyEncryptionRequired > 0 {
            propertiesString += " NotifyEncryptionRequired"
        }
        if properties & indicateEncryptionRequired > 0 {
            propertiesString += " IndicateEncryptionRequired"
        }
        return propertiesString
    }

}

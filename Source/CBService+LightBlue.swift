//
//  CBService+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/15.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth


extension CBService {
    /// Obtain the name of the characteristic according to the UUID, if the UUID is the standard defined in the `Bluetooth Developer Portal` then return the name
    public var name : String {
        if self.uuid.name != "" {
            return self.uuid.name
        } else {
            return "UUID: " + self.uuid.uuidString
        }
    }
    
}

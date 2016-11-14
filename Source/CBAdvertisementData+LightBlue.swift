//
//  CBAdvertisementData+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/21.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import Foundation
import CoreBluetooth

open class CBAdvertisementData {
    
    class open func getAdvertisementDataName(_ key: String) -> String{
        if key == CBAdvertisementDataLocalNameKey {
            return "Local Name"
        } else if key == CBAdvertisementDataTxPowerLevelKey {
            return "Tx Power Level"
        } else if key == CBAdvertisementDataServiceUUIDsKey {
            return "Service UUIDs"
        } else if key == CBAdvertisementDataServiceDataKey {
            return "Service Data"
        } else if key == CBAdvertisementDataManufacturerDataKey {
            return "Manufacturer Data"
        } else if key == CBAdvertisementDataOverflowServiceUUIDsKey {
            return "Overfolow Service UUIDs"
        } else if key == CBAdvertisementDataIsConnectable{
            return "Device is Connectable"
        } else if key == CBAdvertisementDataSolicitedServiceUUIDsKey {
            return "Solicited Service UUIDs"
        }
        return key
    }
    
    class open func getAdvertisementDataStringValue(_ datas: [String : AnyObject?], key : String) -> String {
        var resultString : String? = ""
        if key == CBAdvertisementDataLocalNameKey {
            resultString = datas[CBAdvertisementDataLocalNameKey] as? String
        } else if key == CBAdvertisementDataTxPowerLevelKey {
            resultString = datas[CBAdvertisementDataTxPowerLevelKey] as? String
        } else if key == CBAdvertisementDataServiceUUIDsKey {
            if var serviceUUIDs = datas[CBAdvertisementDataServiceUUIDsKey] {
                serviceUUIDs = (datas[CBAdvertisementDataServiceUUIDsKey]!)! as? NSArray
                if serviceUUIDs == nil {
                    return "";
                }
                for i in 0..<serviceUUIDs!.count {
                    resultString = resultString! + "\(serviceUUIDs!.object(at: i)),"
                }
                resultString = resultString!.substring(to: resultString!.characters.index(resultString!.endIndex, offsetBy: -1))
            }
        } else if key == CBAdvertisementDataServiceDataKey {
            let data = (datas[CBAdvertisementDataServiceDataKey]!)! as? NSDictionary
            if data == nil {
                return ""
            }
            print("\(data!)")
            resultString = data!.description.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
        } else if key == CBAdvertisementDataManufacturerDataKey {
            resultString = (datas[CBAdvertisementDataManufacturerDataKey] as? Data)?.description
        } else if key == CBAdvertisementDataOverflowServiceUUIDsKey {
            resultString = ""
        } else if key == CBAdvertisementDataIsConnectable{
            if let connectable = datas[key] as? NSNumber {
                resultString = connectable.boolValue ? "true" : "false"
            }
        } else if key == CBAdvertisementDataSolicitedServiceUUIDsKey {
            resultString = ""
        }
        if resultString == nil {
            resultString = ""
        }
        return resultString!
    }
    
}

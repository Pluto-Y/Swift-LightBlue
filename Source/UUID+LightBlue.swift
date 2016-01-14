//
//  UUID+LightBlue.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/1/14.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

public let LBStandardServiceUUIDGenericAccess               = CBUUID(string: "1800")
public let LBStandardServiceUUIDGenericAttribute            = CBUUID(string: "1801")
public let LBStandardServiceUUIDImmediateAlert              = CBUUID(string: "1802")
public let LBStandardServiceUUIDLinkLoss                    = CBUUID(string: "1803")
public let LBStandardServiceUUIDTxPower                     = CBUUID(string: "1804")
public let LBStandardServiceUUIDCurrentTimeService          = CBUUID(string: "1805")
public let LBStandardServiceUUIDReferenceTimeUpdateService  = CBUUID(string: "1806")
public let LBStandardServiceUUIDNextDSTChangeService        = CBUUID(string: "1807")
public let LBStandardServiceUUIDGlucose                     = CBUUID(string: "1808")
public let LBStandardServiceUUIDHealthThermometer           = CBUUID(string: "1809")
public let LBStandardServiceUUIDDeviceInformation           = CBUUID(string: "180A")
public let LBStandardServiceUUIDHeartRate                   = CBUUID(string: "180D")
public let LBStandardServiceUUIDPhoneAlertStatusService     = CBUUID(string: "180E")
public let LBStandardServiceUUIDBatterService               = CBUUID(string: "180F")
public let LBStandardServiceUUIDBloodPressure               = CBUUID(string: "1810")
public let LBStandardServiceUUIDAlertNotification           = CBUUID(string: "1811")
public let LBStandardServiceUUIDHumanInterfaceDevice        = CBUUID(string: "1812")
public let LBStandardServiceUUIDScanParameters              = CBUUID(string: "1813")
public let LBStandardServiceUUIDRunningSpeedAndCadence      = CBUUID(string: "1814")
public let LBStandardServiceUUIDAutomationIO                = CBUUID(string: "1815")
public let LBStandardServiceUUIDCyclingSpeedAndCadence      = CBUUID(string: "1816")
public let LBStandardServiceUUIDCyclingPower                = CBUUID(string: "1818")
public let LBStandardServiceUUIDLocationAndNavigation       = CBUUID(string: "1819")
public let LBStandardServiceUUIDEnvironmentalSensing        = CBUUID(string: "181A")
public let LBStandardServiceUUIDBodyComposition             = CBUUID(string: "181B")
public let LBStandardServiceUUIDUserData                    = CBUUID(string: "181C")
public let LBStandardServiceUUIDWeightScale                 = CBUUID(string: "181D")
public let LBStandardServiceUUIWeightScale                  = CBUUID(string: "181E")
public let LBStandardServiceUUIDBondManagement              = CBUUID(string: "181F")
public let LBStandardServiceUUIDContinuousGlucoseMonitoring = CBUUID(string: "1820")
public let LBStandardServiceUUIDInternetProtocolSupport     = CBUUID(string: "1821")
public let LBStandardServiceUUIDIndoorPositioning           = CBUUID(string: "1822")
public let LBStandardServiceUUIDPulseOximeter               = CBUUID(string: "1823")
public let LBStandardServiceUUIDHttpProxy                   = CBUUID(string: "1824")
public let LBStandardServiceUUIDObjectTransfer              = CBUUID(string: "1825")

func == (leftUUID : CBUUID, rightUUID: CBUUID) -> Bool {
    return leftUUID.UUIDString.lowercaseString == rightUUID.UUIDString.lowercaseString
}

extension CBUUID {
    override public var description : String {
        
        return ""
    }
}



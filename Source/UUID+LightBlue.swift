//
//  UUID+LightBlue.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/1/14.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

/**
The standard service UUID defined in the `Bluetooth Developer Portal` website.
It will be used to create the standard service and obtain the standard service name.
 */
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
public let LBStandardServiceUUIDBondManagement              = CBUUID(string: "181E")
public let LBStandardServiceUUIDContinuousGlucoseMonitoring = CBUUID(string: "181F")
public let LBStandardServiceUUIDInternetProtocolSupport     = CBUUID(string: "1820")
public let LBStandardServiceUUIDIndoorPositioning           = CBUUID(string: "1821")
public let LBStandardServiceUUIDPulseOximeter               = CBUUID(string: "1822")
public let LBStandardServiceUUIDHttpProxy                   = CBUUID(string: "1823")
public let LBStandardServiceUUIDTransportDiscovery          = CBUUID(string: "1824")
public let LBStandardServiceUUIDObjectTransfer              = CBUUID(string: "1825")


/**
 Add equal operator function to the CBUUID.
 */
func == (leftUUID : CBUUID, rightUUID: CBUUID) -> Bool {
    return leftUUID.UUIDString.lowercaseString == rightUUID.UUIDString.lowercaseString
}

extension CBUUID {
    
    /**
     Obtain the service name according to the service's UUID
     If the UUID is the standard service UUID return the service name
     If not, return the UUIDString as the service name.
     */
    public func serviceName() -> String {
        if self == LBStandardServiceUUIDGenericAccess {
            return "Generic Access"
        } else if self == LBStandardServiceUUIDGenericAttribute {
            return "Generic Attribute"
        } else if self == LBStandardServiceUUIDImmediateAlert {
            return "Immediate Alert"
        } else if self == LBStandardServiceUUIDLinkLoss {
            return "Link Loss"
        } else if self == LBStandardServiceUUIDTxPower {
            return "Tx Power"
        } else if self == LBStandardServiceUUIDCurrentTimeService {
            return "Current Time Service"
        } else if self == LBStandardServiceUUIDReferenceTimeUpdateService {
            return "Reference Time Update Service"
        } else if self == LBStandardServiceUUIDNextDSTChangeService {
            return "Next DST Change Service"
        } else if self == LBStandardServiceUUIDGlucose {
            return "Glucose"
        } else if self == LBStandardServiceUUIDHealthThermometer {
            return "Health Thermometer"
        } else if self == LBStandardServiceUUIDDeviceInformation {
            return "Device Information"
        } else if self == LBStandardServiceUUIDHeartRate {
            return "Heart Rate"
        } else if self == LBStandardServiceUUIDPhoneAlertStatusService {
            return "Phone Alert Status Service"
        } else if self == LBStandardServiceUUIDBatterService {
            return "Batter Service"
        } else if self == LBStandardServiceUUIDBloodPressure {
            return "Blood Pressure"
        } else if self == LBStandardServiceUUIDAlertNotification {
            return "Alert Notification"
        } else if self == LBStandardServiceUUIDHumanInterfaceDevice {
            return "Human Interface Device"
        } else if self == LBStandardServiceUUIDScanParameters {
            return "Scan Parameters"
        } else if self == LBStandardServiceUUIDRunningSpeedAndCadence {
            return "Running Speed And Cadence"
        } else if self == LBStandardServiceUUIDAutomationIO {
            return "Automation IO"
        } else if self == LBStandardServiceUUIDCyclingSpeedAndCadence {
            return "Cycling Speed And Cadence"
        } else if self == LBStandardServiceUUIDCyclingPower {
            return "Cycling Power"
        } else if self == LBStandardServiceUUIDLocationAndNavigation {
            return "Location And Navigation"
        } else if self == LBStandardServiceUUIDEnvironmentalSensing {
            return "Environmental Sensing"
        } else if self == LBStandardServiceUUIDBodyComposition {
            return "Body Composition"
        } else if self == LBStandardServiceUUIDUserData {
            return "User Data"
        } else if self == LBStandardServiceUUIDWeightScale {
            return "Weight Scale"
        } else if self == LBStandardServiceUUIDBondManagement {
            return "Bond Management"
        } else if self == LBStandardServiceUUIDContinuousGlucoseMonitoring {
            return "Continuous Glucose Monitoring"
        } else if self == LBStandardServiceUUIDInternetProtocolSupport {
            return "Internet Protocol Support"
        } else if self == LBStandardServiceUUIDIndoorPositioning {
            return "Indoor Positioning"
        } else if self == LBStandardServiceUUIDPulseOximeter {
            return "Pulse Oximeter"
        } else if self == LBStandardServiceUUIDHttpProxy {
            return "Http Proxy"
        } else if self == LBStandardServiceUUIDTransportDiscovery {
            return "Transport Discovery"
        } else if self == LBStandardServiceUUIDObjectTransfer {
            return "Object Transfer"
        }
        return self.UUIDString
    }
}



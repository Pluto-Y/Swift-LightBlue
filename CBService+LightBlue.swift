//
//  CBService+LightBlue.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/1/15.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth


extension CBService {
    
    /**
     Obtain the service name according to the service's UUID
     If the UUID is the standard service UUID return the service name
     If not, return the UUIDString as the service name.
     */
    public var serviceName : String {
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
        return self.UUID.UUIDString
    }
}
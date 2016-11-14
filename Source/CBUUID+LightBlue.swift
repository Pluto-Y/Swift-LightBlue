//
//  UUID+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/14.
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
The standard characteristic UUID define in the `Bluetooth Developer Portal` website.
It will be used to create the standard characteristic and otain the standard characteristic name.
 */
public let LBStandardCharacteristicUUIDDeviceName                                     = CBUUID(string: "2A00")
public let LBStandardCharacteristicUUIDAppearance                                     = CBUUID(string: "2A01")
public let LBStandardCharacteristicUUIDPeripheralPrivacyFlag                          = CBUUID(string: "2A02")
public let LBStandardCharacteristicUUIDReconnectionAddress                            = CBUUID(string: "2A03")
public let LBStandardCharacteristicUUIDPeripheralPreferredConnectionParameters        = CBUUID(string: "2A04")
public let LBStandardCharacteristicUUIDServiceChanged                                 = CBUUID(string: "2A05")
public let LBStandardCharacteristicUUIDAlertLevel                                     = CBUUID(string: "2A06")
public let LBStandardCharacteristicUUIDTxPowerLevel                                   = CBUUID(string: "2A07")
public let LBStandardCharacteristicUUIDDateTime                                       = CBUUID(string: "2A08")
public let LBStandardCharacteristicUUIDDayOfWeek                                      = CBUUID(string: "2A09")
public let LBStandardCharacteristicUUIDDayDateTime                                    = CBUUID(string: "2A0A")
public let LBStandardCharacteristicUUIDExactTime256                                   = CBUUID(string: "2A0C")
public let LBStandardCharacteristicUUIDDSTOffset                                      = CBUUID(string: "2A0D")
public let LBStandardCharacteristicUUIDTimeZone                                       = CBUUID(string: "2A0E")
public let LBStandardCharacteristicUUIDLocalTimeInformation                           = CBUUID(string: "2A0F")
public let LBStandardCharacteristicUUIDTimeWithDST                                    = CBUUID(string: "2A11")
public let LBStandardCharacteristicUUIDTimeAccuracy                                   = CBUUID(string: "2A12")
public let LBStandardCharacteristicUUIDTimeSource                                     = CBUUID(string: "2A13")
public let LBStandardCharacteristicUUIDReferenceTimeInformation                       = CBUUID(string: "2A14")
public let LBStandardCharacteristicUUIDTimeUpdateControlPoint                         = CBUUID(string: "2A16")
public let LBStandardCharacteristicUUIDTimeUpdateState                                = CBUUID(string: "2A17")
public let LBStandardCharacteristicUUIDGlucoseMeasurement                             = CBUUID(string: "2A18")
public let LBStandardCharacteristicUUIDBatteryLevel                                   = CBUUID(string: "2A19")
public let LBStandardCharacteristicUUIDTemperatureMeasurement                         = CBUUID(string: "2A1C")
public let LBStandardCharacteristicUUIDTemperatureType                                = CBUUID(string: "2A1D")
public let LBStandardCharacteristicUUIDIntermediateTemperature                        = CBUUID(string: "2A1E")
public let LBStandardCharacteristicUUIDMeasurementInterval                            = CBUUID(string: "2A21")
public let LBStandardCharacteristicUUIDBootKeyboardInputReport                        = CBUUID(string: "2A22")
public let LBStandardCharacteristicUUIDSystemID                                       = CBUUID(string: "2A23")
public let LBStandardCharacteristicUUIDModelNumberString                              = CBUUID(string: "2A24")
public let LBStandardCharacteristicUUIDSerialNumberString                             = CBUUID(string: "2A25")
public let LBStandardCharacteristicUUIDFirmwareRevisionString                         = CBUUID(string: "2A26")
public let LBStandardCharacteristicUUIDHardwareRevisionString                         = CBUUID(string: "2A27")
public let LBStandardCharacteristicUUIDSoftwareRevisionString                         = CBUUID(string: "2A28")
public let LBStandardCharacteristicUUIDManufacturerNameString                         = CBUUID(string: "2A29")
public let LBStandardCharacteristicUUIDIEEE11073_20601RegulatoryCertificationDataList = CBUUID(string: "2A2A")
public let LBStandardCharacteristicUUIDCurrentTime                                    = CBUUID(string: "2A2B")
public let LBStandardCharacteristicUUIDMagneticDeclination                            = CBUUID(string: "2A2C")
public let LBStandardCharacteristicUUIDScanRefresh                                    = CBUUID(string: "2A31")
public let LBStandardCharacteristicUUIDBootKeyboardOutputReport                       = CBUUID(string: "2A32")
public let LBStandardCharacteristicUUIDBootMouseInputReport                           = CBUUID(string: "2A33")
public let LBStandardCharacteristicUUIDGlucoseMeasurementContext                      = CBUUID(string: "2A34")
public let LBStandardCharacteristicUUIDBloodPressureMeasurement                       = CBUUID(string: "2A35")
public let LBStandardCharacteristicUUIDIntermediateCuffPressure                       = CBUUID(string: "2A36")
public let LBStandardCharacteristicUUIDHeartRateMeasurement                           = CBUUID(string: "2A37")
public let LBStandardCharacteristicUUIDBodySensorLocation                             = CBUUID(string: "2A38")
public let LBStandardCharacteristicUUIDHeartRateControlPoint                          = CBUUID(string: "2A39")
public let LBStandardCharacteristicUUIDAlertStatus                                    = CBUUID(string: "2A3F")
public let LBStandardCharacteristicUUIDRingerControlPoint                             = CBUUID(string: "2A40")
public let LBStandardCharacteristicUUIDRingerSetting                                  = CBUUID(string: "2A41")
public let LBStandardCharacteristicUUIDAlertCategoryIDBitMask                         = CBUUID(string: "2A42")
public let LBStandardCharacteristicUUIDAlertCategoryID                                = CBUUID(string: "2A43")
public let LBStandardCharacteristicUUIDAlertNotificationControlPoint                  = CBUUID(string: "2A44")
public let LBStandardCharacteristicUUIDUnreadAlertStatus                              = CBUUID(string: "2A45")
public let LBStandardCharacteristicUUIDNewAlert                                       = CBUUID(string: "2A46")
public let LBStandardCharacteristicUUIDSupportedNewAlertCategory                      = CBUUID(string: "2A47")
public let LBStandardCharacteristicUUIDSupportedUnreadAlertCategory                   = CBUUID(string: "2A48")
public let LBStandardCharacteristicUUIDBloodPressureFeature                           = CBUUID(string: "2A49")
public let LBStandardCharacteristicUUIDHIDInformation                                 = CBUUID(string: "2A4A")
public let LBStandardCharacteristicUUIDReportMap                                      = CBUUID(string: "2A4B")
public let LBStandardCharacteristicUUIDHIDControlPoint                                = CBUUID(string: "2A4C")
public let LBStandardCharacteristicUUIDReport                                         = CBUUID(string: "2A4D")
public let LBStandardCharacteristicUUIDProtocolMode                                   = CBUUID(string: "2A4E")
public let LBStandardCharacteristicUUIDScanIntervalWindow                             = CBUUID(string: "2A4F")
public let LBStandardCharacteristicUUIDPnPID                                          = CBUUID(string: "2A50")
public let LBStandardCharacteristicUUIDGlucoseFeature                                 = CBUUID(string: "2A51")
public let LBStandardCharacteristicUUIDRecordAccessControlPoint                       = CBUUID(string: "2A52")
public let LBStandardCharacteristicUUIDRSCMeasurement                                 = CBUUID(string: "2A53")
public let LBStandardCharacteristicUUIDRSCFeature                                     = CBUUID(string: "2A54")
public let LBStandardCharacteristicUUIDSCControlPoint                                 = CBUUID(string: "2A55")
public let LBStandardCharacteristicUUIDDigital                                        = CBUUID(string: "2A56")
public let LBStandardCharacteristicUUIDAnalog                                         = CBUUID(string: "2A58")
public let LBStandardCharacteristicUUIDAggregate                                      = CBUUID(string: "2A5A")
public let LBStandardCharacteristicUUIDCSCMeasurement                                 = CBUUID(string: "2A5B")
public let LBStandardCharacteristicUUIDCSCFeature                                     = CBUUID(string: "2A5C")
public let LBStandardCharacteristicUUIDSensorLocation                                 = CBUUID(string: "2A5D")
public let LBStandardCharacteristicUUIDPLXSpot_CheckMeasurement                       = CBUUID(string: "2A5E")
public let LBStandardCharacteristicUUIDPLXContinuousMeasurement                       = CBUUID(string: "2A5F")
public let LBStandardCharacteristicUUIDPLXFeatures                                    = CBUUID(string: "2A60")
public let LBStandardCharacteristicUUIDCyclingPowerMeasurement                        = CBUUID(string: "2A63")
public let LBStandardCharacteristicUUIDCyclingPowerVector                             = CBUUID(string: "2A64")
public let LBStandardCharacteristicUUIDCyclingPowerFeature                            = CBUUID(string: "2A65")
public let LBStandardCharacteristicUUIDCyclingPowerControlPoint                       = CBUUID(string: "2A66")
public let LBStandardCharacteristicUUIDLocationAndSpeed                               = CBUUID(string: "2A67")
public let LBStandardCharacteristicUUIDNavigation                                     = CBUUID(string: "2A68")
public let LBStandardCharacteristicUUIDPositionQuality                                = CBUUID(string: "2A69")
public let LBStandardCharacteristicUUIDLNFeature                                      = CBUUID(string: "2A6A")
public let LBStandardCharacteristicUUIDLNControlPoint                                 = CBUUID(string: "2A6B")
public let LBStandardCharacteristicUUIDElevation                                      = CBUUID(string: "2A6C")
public let LBStandardCharacteristicUUIDPressure                                       = CBUUID(string: "2A6D")
public let LBStandardCharacteristicUUIDTemperature                                    = CBUUID(string: "2A6E")
public let LBStandardCharacteristicUUIDHumidity                                       = CBUUID(string: "2A6F")
public let LBStandardCharacteristicUUIDTrueWindSpeed                                  = CBUUID(string: "2A70")
public let LBStandardCharacteristicUUIDTrueWindDirection                              = CBUUID(string: "2A71")
public let LBStandardCharacteristicUUIDApparentWindSpeed                              = CBUUID(string: "2A72")
public let LBStandardCharacteristicUUIDApparentWindDirection                          = CBUUID(string: "2A73")
public let LBStandardCharacteristicUUIDGustFactor                                     = CBUUID(string: "2A74")
public let LBStandardCharacteristicUUIDPollenConcentration                            = CBUUID(string: "2A75")
public let LBStandardCharacteristicUUIDUVIndex                                        = CBUUID(string: "2A76")
public let LBStandardCharacteristicUUIDIrradiance                                     = CBUUID(string: "2A77")
public let LBStandardCharacteristicUUIDRainfall                                       = CBUUID(string: "2A78")
public let LBStandardCharacteristicUUIDWindChill                                      = CBUUID(string: "2A79")
public let LBStandardCharacteristicUUIDHeatIndex                                      = CBUUID(string: "2A7A")
public let LBStandardCharacteristicUUIDDewPoint                                       = CBUUID(string: "2A7B")
public let LBStandardCharacteristicUUIDDescriptorValueChanged                         = CBUUID(string: "2A7D")
public let LBStandardCharacteristicUUIDAerobicHeartRateLowerLimit                     = CBUUID(string: "2A7E")
public let LBStandardCharacteristicUUIDAerobicThreshold                               = CBUUID(string: "2A7F")
public let LBStandardCharacteristicUUIDAge                                            = CBUUID(string: "2A80")
public let LBStandardCharacteristicUUIDAnaerobicHeartRateLowerLimit                   = CBUUID(string: "2A81")
public let LBStandardCharacteristicUUIDAnaerobicHeartRateUpperLimit                   = CBUUID(string: "2A82")
public let LBStandardCharacteristicUUIDAnaerobicThreshold                             = CBUUID(string: "2A83")
public let LBStandardCharacteristicUUIDAerobicHeartRateUpperLimit                     = CBUUID(string: "2A84")
public let LBStandardCharacteristicUUIDDateOfBirth                                     = CBUUID(string: "2A85")
public let LBStandardCharacteristicUUIDDateOfThresholdAssessment                      = CBUUID(string: "2A86")
public let LBStandardCharacteristicUUIDEmailAddress                                   = CBUUID(string: "2A87")
public let LBStandardCharacteristicUUIDFatHeartRateLowerLimit                         = CBUUID(string: "2A88")
public let LBStandardCharacteristicUUIDFatBurnHeartRateUpperLimit                     = CBUUID(string: "2A89")
public let LBStandardCharacteristicUUIDFirstName                                      = CBUUID(string: "2A8A")
public let LBStandardCharacteristicUUIDFiveZoneHeartRateLimits                        = CBUUID(string: "2A8B")
public let LBStandardCharacteristicUUIDGender                                         = CBUUID(string: "2A8C")
public let LBStandardCharacteristicUUIDHeartRateMax                                   = CBUUID(string: "2A8D")
public let LBStandardCharacteristicUUIDHeight                                         = CBUUID(string: "2A8E")
public let LBStandardCharacteristicUUIDHipCircumference                               = CBUUID(string: "2A8F")
public let LBStandardCharacteristicUUIDLastName                                       = CBUUID(string: "2A90")
public let LBStandardCharacteristicUUIDMaximumRecommendedHeartRate                    = CBUUID(string: "2A91")
public let LBStandardCharacteristicUUIDRestingHeartRate                               = CBUUID(string: "2A92")
public let LBStandardCharacteristicUUIDSportTypeforAerobicandAnaerobicThresholds      = CBUUID(string: "2A93")
public let LBStandardCharacteristicUUIDThreeZoneHeartRateLimits                       = CBUUID(string: "2A94")
public let LBStandardCharacteristicUUIDTwoZoneHeartRateLimit                          = CBUUID(string: "2A95")
public let LBStandardCharacteristicUUIDVO2Max                                         = CBUUID(string: "2A96")
public let LBStandardCharacteristicUUIDWaistCircumference                             = CBUUID(string: "2A97")
public let LBStandardCharacteristicUUIDWeight                                         = CBUUID(string: "2A98")
public let LBStandardCharacteristicUUIDDatabaseChangeIncrement                        = CBUUID(string: "2A99")
public let LBStandardCharacteristicUUIDUserIndex                                      = CBUUID(string: "2A9A")
public let LBStandardCharacteristicUUIDBodyCompositionFeature                         = CBUUID(string: "2A9B")
public let LBStandardCharacteristicUUIDBodyCompositionMeasurement                     = CBUUID(string: "2A9C")
public let LBStandardCharacteristicUUIDWeightMeasurement                              = CBUUID(string: "2A9D")
public let LBStandardCharacteristicUUIDWeightScaleFeature                             = CBUUID(string: "2A9E")
public let LBStandardCharacteristicUUIDUserControlPoint                               = CBUUID(string: "2A9F")
public let LBStandardCharacteristicUUIDMagneticFluxDensity2D                          = CBUUID(string: "2AA0")
public let LBStandardCharacteristicUUIDMagneticFluxDensity3D                          = CBUUID(string: "2AA1")
public let LBStandardCharacteristicUUIDLanguage                                       = CBUUID(string: "2AA2")
public let LBStandardCharacteristicUUIDBarometricPressureTrend                        = CBUUID(string: "2AA3")
public let LBStandardCharacteristicUUIDBondManagementControlPoint                     = CBUUID(string: "2AA4")
public let LBStandardCharacteristicUUIDBondManagementFeature                          = CBUUID(string: "2AA5")
public let LBStandardCharacteristicUUIDCentralAddressResolution                       = CBUUID(string: "2AA6")
public let LBStandardCharacteristicUUIDCGMMeasurement                                 = CBUUID(string: "2AA7")
public let LBStandardCharacteristicUUIDCGMFeature                                     = CBUUID(string: "2AA8")
public let LBStandardCharacteristicUUIDCGMStatus                                      = CBUUID(string: "2AA9")
public let LBStandardCharacteristicUUIDCGMSessionStartTime                            = CBUUID(string: "2AAA")
public let LBStandardCharacteristicUUIDCGMSessionRunTime                              = CBUUID(string: "2AAB")
public let LBStandardCharacteristicUUIDCGMSpecificOpsControlPoint                     = CBUUID(string: "2AAC")
public let LBStandardCharacteristicUUIDIndoorPositioningConfiguration                 = CBUUID(string: "2AAD")
public let LBStandardCharacteristicUUIDLatitude                                       = CBUUID(string: "2AAE")
public let LBStandardCharacteristicUUIDLongitude                                      = CBUUID(string: "2AAF")
public let LBStandardCharacteristicUUIDLocalNorthCoordinate                           = CBUUID(string: "2AB0")
public let LBStandardCharacteristicUUIDLocalEastCoordinate                            = CBUUID(string: "2AB1")
public let LBStandardCharacteristicUUIDFloorNumber                                    = CBUUID(string: "2AB2")
public let LBStandardCharacteristicUUIDAltitude                                       = CBUUID(string: "2AB3")
public let LBStandardCharacteristicUUIDUncertainty                                    = CBUUID(string: "2AB4")
public let LBStandardCharacteristicUUIDLocationName                                   = CBUUID(string: "2AB5")
public let LBStandardCharacteristicUUIDURI                                            = CBUUID(string: "2AB6")
public let LBStandardCharacteristicUUIDHTTPHeaders                                    = CBUUID(string: "2AB7")
public let LBStandardCharacteristicUUIDHTTPStatusCode                                 = CBUUID(string: "2AB8")
public let LBStandardCharacteristicUUIDHTTPEntityBody                                 = CBUUID(string: "2AB9")
public let LBStandardCharacteristicUUIDHTTPControlPoint                               = CBUUID(string: "2ABA")
public let LBStandardCharacteristicUUIDHTTPSSecurity                                  = CBUUID(string: "2ABB")
public let LBStandardCharacteristicUUIDTDSControlPoint                                = CBUUID(string: "2ABC")
public let LBStandardCharacteristicUUIDOTSFeature                                     = CBUUID(string: "2ABD")
public let LBStandardCharacteristicUUIDObjectName                                     = CBUUID(string: "2ABE")
public let LBStandardCharacteristicUUIDObjectType                                     = CBUUID(string: "2ABF")
public let LBStandardCharacteristicUUIDObjectSize                                     = CBUUID(string: "2AC0")
public let LBStandardCharacteristicUUIDObjectFirst_Created                            = CBUUID(string: "2AC1")
public let LBStandardCharacteristicUUIDObjectLast_Modified                            = CBUUID(string: "2AC2")
public let LBStandardCharacteristicUUIDObjectID                                       = CBUUID(string: "2AC3")
public let LBStandardCharacteristicUUIDObjectProperties                               = CBUUID(string: "2AC4")
public let LBStandardCharacteristicUUIDObjectActionControlPoint                       = CBUUID(string: "2AC5")
public let LBStandardCharacteristicUUIDObjectListControlPoint                         = CBUUID(string: "2AC6")
public let LBStandardCharacteristicUUIDObjectListFilter                               = CBUUID(string: "2AC7")
public let LBStandardCharacteristicUUIDObjectChanged                                  = CBUUID(string: "2AC8")


/**
 Add equal operator function to the CBUUID.
 */
func == (leftUUID : CBUUID, rightUUID: CBUUID) -> Bool {
    return leftUUID.uuidString.lowercased() == rightUUID.uuidString.lowercased()
}

extension CBUUID {
    
    /**
     Obtain the UUID name
     If the UUID is the standard service UUID return the standard name
     If not, return the UUIDString as the name.
     */
    public var name : String {
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
        } else if self == LBStandardCharacteristicUUIDDeviceName {
            return "Device Name"
        } else if self == LBStandardCharacteristicUUIDAppearance {
            return "Appearance"
        } else if self == LBStandardCharacteristicUUIDPeripheralPrivacyFlag {
            return "Peripheral Privacy Flag"
        } else if self == LBStandardCharacteristicUUIDReconnectionAddress {
            return "Reconnection Address"
        } else if self == LBStandardCharacteristicUUIDPeripheralPreferredConnectionParameters {
            return "Peripheral Preferred Connection Parameters"
        } else if self == LBStandardCharacteristicUUIDServiceChanged {
            return "Service Changed"
        } else if self == LBStandardCharacteristicUUIDAlertLevel {
            return "Alert Level"
        } else if self == LBStandardCharacteristicUUIDTxPowerLevel {
            return "Tx Power Level"
        } else if self == LBStandardCharacteristicUUIDDateTime {
            return "Date Time"
        } else if self == LBStandardCharacteristicUUIDDayOfWeek {
            return "Day Of Week"
        } else if self == LBStandardCharacteristicUUIDDayDateTime {
            return "Day Date Time"
        } else if self == LBStandardCharacteristicUUIDExactTime256 {
            return "Exact Time 256"
        } else if self == LBStandardCharacteristicUUIDDSTOffset {
            return "DST Offset"
        } else if self == LBStandardCharacteristicUUIDTimeZone {
            return "Time Zone"
        } else if self == LBStandardCharacteristicUUIDLocalTimeInformation {
            return "Local Time Information"
        } else if self == LBStandardCharacteristicUUIDTimeWithDST {
            return "Time With DST"
        } else if self == LBStandardCharacteristicUUIDTimeAccuracy {
            return "Time Accuracy"
        } else if self == LBStandardCharacteristicUUIDTimeSource {
            return "Time Source"
        } else if self == LBStandardCharacteristicUUIDReferenceTimeInformation {
            return "Reference Time Information"
        } else if self == LBStandardCharacteristicUUIDTimeUpdateControlPoint {
            return "Time Update Control Point"
        } else if self == LBStandardCharacteristicUUIDTimeUpdateState {
            return "Time Update State"
        } else if self == LBStandardCharacteristicUUIDGlucoseMeasurement {
            return "Glucose Measurement"
        } else if self == LBStandardCharacteristicUUIDBatteryLevel {
            return "Battery Level"
        } else if self == LBStandardCharacteristicUUIDTemperatureMeasurement {
            return "Temperature Measurement"
        } else if self == LBStandardCharacteristicUUIDTemperatureType {
            return "Temperature Type"
        } else if self == LBStandardCharacteristicUUIDIntermediateTemperature {
            return "Intermediate Temperature"
        } else if self == LBStandardCharacteristicUUIDMeasurementInterval {
            return "Measurement Interval"
        } else if self == LBStandardCharacteristicUUIDBootKeyboardInputReport {
            return "Boot Keyboard Input Report"
        } else if self == LBStandardCharacteristicUUIDSystemID {
            return "System ID"
        } else if self == LBStandardCharacteristicUUIDModelNumberString {
            return "Model Number String"
        } else if self == LBStandardCharacteristicUUIDSerialNumberString {
            return "Serial Number String"
        } else if self == LBStandardCharacteristicUUIDFirmwareRevisionString {
            return "Firmware Revision String"
        } else if self == LBStandardCharacteristicUUIDHardwareRevisionString {
            return "Hardware Revision String"
        } else if self == LBStandardCharacteristicUUIDSoftwareRevisionString {
            return "Software Revision String"
        } else if self == LBStandardCharacteristicUUIDManufacturerNameString {
            return "Manufacturer Name String"
        } else if self == LBStandardCharacteristicUUIDIEEE11073_20601RegulatoryCertificationDataList {
            return "IEEE11073-20601 Regulatory Certification Data List"
        } else if self == LBStandardCharacteristicUUIDCurrentTime {
            return "Current Time"
        } else if self == LBStandardCharacteristicUUIDMagneticDeclination {
            return "Magnetic Declination"
        } else if self == LBStandardCharacteristicUUIDScanRefresh {
            return "Scan Refresh"
        } else if self == LBStandardCharacteristicUUIDBootKeyboardOutputReport {
            return "Boot Keyboard Output Report"
        } else if self == LBStandardCharacteristicUUIDBootMouseInputReport {
            return "Boot Mouse Input Report"
        } else if self == LBStandardCharacteristicUUIDGlucoseMeasurementContext {
            return "Glucose Measurement Context"
        } else if self == LBStandardCharacteristicUUIDBloodPressureMeasurement {
            return "Blood Pressure Measurement"
        } else if self == LBStandardCharacteristicUUIDIntermediateCuffPressure {
            return "Intermediate Cuff Pressure"
        } else if self == LBStandardCharacteristicUUIDHeartRateMeasurement {
            return "Heart Rate Measurement"
        } else if self == LBStandardCharacteristicUUIDBodySensorLocation {
            return "Body Sensor Location"
        } else if self == LBStandardCharacteristicUUIDHeartRateControlPoint {
            return "Heart Rate Control Point"
        } else if self == LBStandardCharacteristicUUIDAlertStatus {
            return "Alert Status"
        } else if self == LBStandardCharacteristicUUIDRingerControlPoint {
            return "Ringer Control Point"
        } else if self == LBStandardCharacteristicUUIDRingerSetting {
            return "Ringer Setting"
        } else if self == LBStandardCharacteristicUUIDAlertCategoryIDBitMask {
            return "Alert Category ID Bit Mask"
        } else if self == LBStandardCharacteristicUUIDAlertCategoryID {
            return "Alert Category ID"
        } else if self == LBStandardCharacteristicUUIDAlertNotificationControlPoint {
            return "Alert Notification Control Point"
        } else if self == LBStandardCharacteristicUUIDUnreadAlertStatus {
            return "Unread Alert Status"
        } else if self == LBStandardCharacteristicUUIDNewAlert {
            return "New Alert"
        } else if self == LBStandardCharacteristicUUIDSupportedNewAlertCategory {
            return "Supported New Alert Category"
        } else if self == LBStandardCharacteristicUUIDSupportedUnreadAlertCategory {
            return "Supported Unread Alert Category"
        } else if self == LBStandardCharacteristicUUIDBloodPressureFeature {
            return "Blood Pressure Feature"
        } else if self == LBStandardCharacteristicUUIDHIDInformation {
            return "HID Information"
        } else if self == LBStandardCharacteristicUUIDReportMap {
            return "Report Map"
        } else if self == LBStandardCharacteristicUUIDHIDControlPoint {
            return "HID Control Point"
        } else if self == LBStandardCharacteristicUUIDReport {
            return "Report"
        } else if self == LBStandardCharacteristicUUIDProtocolMode {
            return "Protocol Mode"
        } else if self == LBStandardCharacteristicUUIDScanIntervalWindow {
            return "Scan Interval Window"
        } else if self == LBStandardCharacteristicUUIDPnPID {
            return "Pn PID"
        } else if self == LBStandardCharacteristicUUIDGlucoseFeature {
            return "Glucose Feature"
        } else if self == LBStandardCharacteristicUUIDRecordAccessControlPoint {
            return "Record Access Control Point"
        } else if self == LBStandardCharacteristicUUIDRSCMeasurement {
            return "RSC Measurement"
        } else if self == LBStandardCharacteristicUUIDRSCFeature {
            return "RSC Feature"
        } else if self == LBStandardCharacteristicUUIDSCControlPoint {
            return "SC Control Point"
        } else if self == LBStandardCharacteristicUUIDDigital {
            return "Digital"
        } else if self == LBStandardCharacteristicUUIDAnalog {
            return "Analog"
        } else if self == LBStandardCharacteristicUUIDAggregate {
            return "Aggregate"
        } else if self == LBStandardCharacteristicUUIDCSCMeasurement {
            return "CSC Measurement"
        } else if self == LBStandardCharacteristicUUIDCSCFeature {
            return "CSC Feature"
        } else if self == LBStandardCharacteristicUUIDSensorLocation {
            return "Sensor Location"
        } else if self == LBStandardCharacteristicUUIDPLXSpot_CheckMeasurement {
            return "PLX Spot-Check Measurement"
        } else if self == LBStandardCharacteristicUUIDPLXContinuousMeasurement {
            return "PLX Continuous Measurement"
        } else if self == LBStandardCharacteristicUUIDPLXFeatures {
            return "PLX Features"
        } else if self == LBStandardCharacteristicUUIDCyclingPowerMeasurement {
            return "Cycling Power Measurement"
        } else if self == LBStandardCharacteristicUUIDCyclingPowerVector {
            return "Cycling Power Vector"
        } else if self == LBStandardCharacteristicUUIDCyclingPowerFeature {
            return "Cycling Power Feature"
        } else if self == LBStandardCharacteristicUUIDCyclingPowerControlPoint {
            return "Cycling Power Control Point"
        } else if self == LBStandardCharacteristicUUIDLocationAndSpeed {
            return "Location AndSpeed"
        } else if self == LBStandardCharacteristicUUIDNavigation {
            return "Navigation"
        } else if self == LBStandardCharacteristicUUIDPositionQuality {
            return "Position Quality"
        } else if self == LBStandardCharacteristicUUIDLNFeature {
            return "LN Feature"
        } else if self == LBStandardCharacteristicUUIDLNControlPoint {
            return "LN Control Point"
        } else if self == LBStandardCharacteristicUUIDElevation {
            return "Elevation"
        } else if self == LBStandardCharacteristicUUIDPressure {
            return "Pressure"
        } else if self == LBStandardCharacteristicUUIDTemperature {
            return "Temperature"
        } else if self == LBStandardCharacteristicUUIDHumidity {
            return "Humidity"
        } else if self == LBStandardCharacteristicUUIDTrueWindSpeed {
            return "True Wind Speed"
        } else if self == LBStandardCharacteristicUUIDTrueWindDirection {
            return "True Wind Direction"
        } else if self == LBStandardCharacteristicUUIDApparentWindSpeed {
            return "Apparent Wind Speed"
        } else if self == LBStandardCharacteristicUUIDApparentWindDirection {
            return "Apparent Wind Direction"
        } else if self == LBStandardCharacteristicUUIDGustFactor {
            return "Gust Factor"
        } else if self == LBStandardCharacteristicUUIDPollenConcentration {
            return "Pollen Concentration"
        } else if self == LBStandardCharacteristicUUIDUVIndex {
            return "UVIndex"
        } else if self == LBStandardCharacteristicUUIDIrradiance {
            return "Irradiance"
        } else if self == LBStandardCharacteristicUUIDRainfall {
            return "Rainfall"
        } else if self == LBStandardCharacteristicUUIDWindChill {
            return "Wind Chill"
        } else if self == LBStandardCharacteristicUUIDHeatIndex {
            return "Heat Index"
        } else if self == LBStandardCharacteristicUUIDDewPoint {
            return "Dew Point"
        } else if self == LBStandardCharacteristicUUIDDescriptorValueChanged {
            return "Descriptor Value Changed"
        } else if self == LBStandardCharacteristicUUIDAerobicHeartRateLowerLimit {
            return "Aerobic Heart Rate Lower Limit"
        } else if self == LBStandardCharacteristicUUIDAerobicThreshold {
            return "Aerobic Threshold"
        } else if self == LBStandardCharacteristicUUIDAge {
            return "Age"
        } else if self == LBStandardCharacteristicUUIDAnaerobicHeartRateLowerLimit {
            return "Anaerobic Heart Rate Lower Limit"
        } else if self == LBStandardCharacteristicUUIDAnaerobicHeartRateUpperLimit {
            return "Anaerobic Heart Rate Upper Limit"
        } else if self == LBStandardCharacteristicUUIDAnaerobicThreshold {
            return "Anaerobic Threshold"
        } else if self == LBStandardCharacteristicUUIDAerobicHeartRateUpperLimit {
            return "Aerobic Heart Rate Upper Limit"
        } else if self == LBStandardCharacteristicUUIDDateOfBirth {
            return "Date Of Birth"
        } else if self == LBStandardCharacteristicUUIDDateOfThresholdAssessment {
            return "Date Of Threshold Assessment"
        } else if self == LBStandardCharacteristicUUIDEmailAddress {
            return "Email Address"
        } else if self == LBStandardCharacteristicUUIDFatHeartRateLowerLimit {
            return "Fat Heart Rate Lower Limit"
        } else if self == LBStandardCharacteristicUUIDFatBurnHeartRateUpperLimit {
            return "Fat Burn Heart Rate Upper Limit"
        } else if self == LBStandardCharacteristicUUIDFirstName {
            return "First Name"
        } else if self == LBStandardCharacteristicUUIDFiveZoneHeartRateLimits {
            return "Five Zone Heart Rate Limits"
        } else if self == LBStandardCharacteristicUUIDGender {
            return "Gender"
        } else if self == LBStandardCharacteristicUUIDHeartRateMax {
            return "Heart Rate Max"
        } else if self == LBStandardCharacteristicUUIDHeight {
            return "Height"
        } else if self == LBStandardCharacteristicUUIDHipCircumference {
            return "Hip Circumference"
        } else if self == LBStandardCharacteristicUUIDLastName {
            return "Last Name"
        } else if self == LBStandardCharacteristicUUIDMaximumRecommendedHeartRate {
            return "Maximum Recommended HeartRate"
        } else if self == LBStandardCharacteristicUUIDRestingHeartRate {
            return "Resting Heart Rate"
        } else if self == LBStandardCharacteristicUUIDSportTypeforAerobicandAnaerobicThresholds {
            return "Sport Type for Aerobicand Anaerobic Thresholds"
        } else if self == LBStandardCharacteristicUUIDThreeZoneHeartRateLimits {
            return "Three Zone Heart Rate Limits"
        } else if self == LBStandardCharacteristicUUIDTwoZoneHeartRateLimit {
            return "Two Zone Heart Rate Limit"
        } else if self == LBStandardCharacteristicUUIDVO2Max {
            return "VO2Max"
        } else if self == LBStandardCharacteristicUUIDWaistCircumference {
            return "Waist Circumference"
        } else if self == LBStandardCharacteristicUUIDWeight {
            return "Weight"
        } else if self == LBStandardCharacteristicUUIDDatabaseChangeIncrement {
            return "Database Change Increment"
        } else if self == LBStandardCharacteristicUUIDUserIndex {
            return "User Index"
        } else if self == LBStandardCharacteristicUUIDBodyCompositionFeature {
            return "Body Composition Feature"
        } else if self == LBStandardCharacteristicUUIDBodyCompositionMeasurement {
            return "Body Composition Measurement"
        } else if self == LBStandardCharacteristicUUIDWeightMeasurement {
            return "Weight Measurement"
        } else if self == LBStandardCharacteristicUUIDWeightScaleFeature {
            return "Weight Scale Feature"
        } else if self == LBStandardCharacteristicUUIDUserControlPoint {
            return "User Control Point"
        } else if self == LBStandardCharacteristicUUIDMagneticFluxDensity2D {
            return "Magnetic Flux Density 2D"
        } else if self == LBStandardCharacteristicUUIDMagneticFluxDensity3D {
            return "Magnetic Flux Density 3D"
        } else if self == LBStandardCharacteristicUUIDLanguage {
            return "Language"
        } else if self == LBStandardCharacteristicUUIDBarometricPressureTrend {
            return "Barometric Pressure Trend"
        } else if self == LBStandardCharacteristicUUIDBondManagementControlPoint {
            return "Bond Management Control Point"
        } else if self == LBStandardCharacteristicUUIDBondManagementFeature {
            return "Bond Management Feature"
        } else if self == LBStandardCharacteristicUUIDCentralAddressResolution {
            return "Central Address Resolution"
        } else if self == LBStandardCharacteristicUUIDCGMMeasurement {
            return "CGM Measurement"
        } else if self == LBStandardCharacteristicUUIDCGMFeature {
            return "CGM Feature"
        } else if self == LBStandardCharacteristicUUIDCGMStatus {
            return "CGM Status"
        } else if self == LBStandardCharacteristicUUIDCGMSessionStartTime {
            return "CGM Session Start Time"
        } else if self == LBStandardCharacteristicUUIDCGMSessionRunTime {
            return "CGM Session Run Time"
        } else if self == LBStandardCharacteristicUUIDCGMSpecificOpsControlPoint {
            return "CGM Specific Ops Control Point"
        } else if self == LBStandardCharacteristicUUIDIndoorPositioningConfiguration {
            return "Indoor Positioning Configuration"
        } else if self == LBStandardCharacteristicUUIDLatitude {
            return "Latitude"
        } else if self == LBStandardCharacteristicUUIDLongitude {
            return "Longitude"
        } else if self == LBStandardCharacteristicUUIDLocalNorthCoordinate {
            return "Local North Coordinate"
        } else if self == LBStandardCharacteristicUUIDLocalEastCoordinate {
            return "Local East Coordinate"
        } else if self == LBStandardCharacteristicUUIDFloorNumber {
            return "Floor Number"
        } else if self == LBStandardCharacteristicUUIDAltitude {
            return "Altitude"
        } else if self == LBStandardCharacteristicUUIDUncertainty {
            return "Uncertainty"
        } else if self == LBStandardCharacteristicUUIDLocationName {
            return "Location Name"
        } else if self == LBStandardCharacteristicUUIDURI {
            return "URI"
        } else if self == LBStandardCharacteristicUUIDHTTPHeaders {
            return "HTTP Headers"
        } else if self == LBStandardCharacteristicUUIDHTTPStatusCode {
            return "HTTP StatusCode"
        } else if self == LBStandardCharacteristicUUIDHTTPEntityBody {
            return "HTTP EntityBody"
        } else if self == LBStandardCharacteristicUUIDHTTPControlPoint {
            return "HTTP ControlPoint"
        } else if self == LBStandardCharacteristicUUIDHTTPSSecurity {
            return "HTTPS Security"
        } else if self == LBStandardCharacteristicUUIDTDSControlPoint {
            return "TDS Control Point"
        } else if self == LBStandardCharacteristicUUIDOTSFeature {
            return "OTS Feature"
        } else if self == LBStandardCharacteristicUUIDObjectName {
            return "Object Name"
        } else if self == LBStandardCharacteristicUUIDObjectType {
            return "ObjectType"
        } else if self == LBStandardCharacteristicUUIDObjectSize {
            return "Object Size"
        } else if self == LBStandardCharacteristicUUIDObjectFirst_Created {
            return "Object First-Created"
        } else if self == LBStandardCharacteristicUUIDObjectLast_Modified {
            return "Object Last-Modified"
        } else if self == LBStandardCharacteristicUUIDObjectID {
            return "Object ID"
        } else if self == LBStandardCharacteristicUUIDObjectProperties {
            return "Object Properties"
        } else if self == LBStandardCharacteristicUUIDObjectActionControlPoint {
            return "Object Action Control Point"
        } else if self == LBStandardCharacteristicUUIDObjectListControlPoint {
            return "ObjectList Control Point"
        } else if self == LBStandardCharacteristicUUIDObjectListFilter {
            return "Object List Filter"
        } else if self == LBStandardCharacteristicUUIDObjectChanged {
            return "Object Changed"
        }
        return ""
    }
}

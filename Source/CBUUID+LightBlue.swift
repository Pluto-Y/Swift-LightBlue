//
//  CBUUID.+LightBlue.swift
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
extension CBUUID {
    static public let genericAccessUUID               = CBUUID(string: "1800")
    static public let genericAttributeUUID            = CBUUID(string: "1801")
    static public let immediateAlertUUID              = CBUUID(string: "1802")
    static public let linkLossUUID                    = CBUUID(string: "1803")
    static public let txPowerUUID                     = CBUUID(string: "1804")
    static public let currentTimeServiceUUID          = CBUUID(string: "1805")
    static public let referenceTimeUpdateServiceUUID  = CBUUID(string: "1806")
    static public let nextDSTChangeServiceUUID        = CBUUID(string: "1807")
    static public let glucoseUUID                     = CBUUID(string: "1808")
    static public let healthThermometerUUID           = CBUUID(string: "1809")
    static public let deviceInformationUUID           = CBUUID(string: "180A")
    static public let heartRateUUID                   = CBUUID(string: "180D")
    static public let phoneAlertStatusServiceUUID     = CBUUID(string: "180E")
    static public let batterServiceUUID               = CBUUID(string: "180F")
    static public let bloodPressureUUID               = CBUUID(string: "1810")
    static public let alertNotificationUUID           = CBUUID(string: "1811")
    static public let humanInterfaceDeviceUUID        = CBUUID(string: "1812")
    static public let scanParametersUUID              = CBUUID(string: "1813")
    static public let runningSpeedAndCadenceUUID      = CBUUID(string: "1814")
    static public let automationIOUUID                = CBUUID(string: "1815")
    static public let cyclingSpeedAndCadenceUUID      = CBUUID(string: "1816")
    static public let cyclingPowerUUID                = CBUUID(string: "1818")
    static public let locationAndNavigationUUID       = CBUUID(string: "1819")
    static public let environmentalSensingUUID        = CBUUID(string: "181A")
    static public let bodyCompositionUUID             = CBUUID(string: "181B")
    static public let userDataUUID                    = CBUUID(string: "181C")
    static public let weightScaleUUID                 = CBUUID(string: "181D")
    static public let bondManagementUUID              = CBUUID(string: "181E")
    static public let continuousGlucoseMonitoringUUID = CBUUID(string: "181F")
    static public let internetProtocolSupportUUID     = CBUUID(string: "1820")
    static public let indoorPositioningUUID           = CBUUID(string: "1821")
    static public let pulseOximeterUUID               = CBUUID(string: "1822")
    static public let httpProxyUUID                   = CBUUID(string: "1823")
    static public let transportDiscoveryUUID          = CBUUID(string: "1824")
    static public let objectTransferUUID              = CBUUID(string: "1825")
    static public let fitnessMachineUUID              = CBUUID(string: "1826")
    static public let meshProvisioningServiceUUID     = CBUUID(string: "1827")
    static public let meshProxyServiceUUID            = CBUUID(string: "1828")
    static public let reconnectionConfigurationUUID   = CBUUID(string: "1829")
    static public let insulinDeliveryUUID             = CBUUID(string: "182A")
}

/**
The standard characteristic UUID define in the `Bluetooth Developer Portal` website.
It will be used to create the standard characteristic and otain the standard characteristic name.
 */
extension CBUUID {
	static public let deviceNameUUID                                     = CBUUID(string: "2A00")
	static public let appearanceUUID                                     = CBUUID(string: "2A01")
	static public let peripheralPrivacyFlagUUID                          = CBUUID(string: "2A02")
	static public let reconnectionAddressUUID                            = CBUUID(string: "2A03")
	static public let peripheralPreferredConnectionParametersUUID        = CBUUID(string: "2A04")
	static public let serviceChangedUUID                                 = CBUUID(string: "2A05")
	static public let alertLevelUUID                                     = CBUUID(string: "2A06")
	static public let txPowerLevelUUID                                   = CBUUID(string: "2A07")
	static public let dateTimeUUID                                       = CBUUID(string: "2A08")
	static public let dayOfWeekUUID                                      = CBUUID(string: "2A09")
	static public let dayDateTimeUUID                                    = CBUUID(string: "2A0A")
	static public let exactTime256UUID                                   = CBUUID(string: "2A0C")
	static public let DSTOffsetUUID                                      = CBUUID(string: "2A0D")
	static public let timeZoneUUID                                       = CBUUID(string: "2A0E")
	static public let localTimeInformationUUID                           = CBUUID(string: "2A0F")
	static public let timeWithDSTUUID                                    = CBUUID(string: "2A11")
	static public let timeAccuracyUUID                                   = CBUUID(string: "2A12")
	static public let timeSourceUUID                                     = CBUUID(string: "2A13")
	static public let referenceTimeInformationUUID                       = CBUUID(string: "2A14")
	static public let timeUpdateControlPointUUID                         = CBUUID(string: "2A16")
	static public let timeUpdateStateUUID                                = CBUUID(string: "2A17")
	static public let glucoseMeasurementUUID                             = CBUUID(string: "2A18")
	static public let batteryLevelUUID                                   = CBUUID(string: "2A19")
	static public let temperatureMeasurementUUID                         = CBUUID(string: "2A1C")
	static public let temperatureTypeUUID                                = CBUUID(string: "2A1D")
	static public let intermediateTemperatureUUID                        = CBUUID(string: "2A1E")
	static public let measurementIntervalUUID                            = CBUUID(string: "2A21")
	static public let bootKeyboardInputReportUUID                        = CBUUID(string: "2A22")
	static public let systemIDUUID                                       = CBUUID(string: "2A23")
	static public let modelNumberStringUUID                              = CBUUID(string: "2A24")
	static public let serialNumberStringUUID                             = CBUUID(string: "2A25")
	static public let firmwareRevisionStringUUID                         = CBUUID(string: "2A26")
	static public let hardwareRevisionStringUUID                         = CBUUID(string: "2A27")
	static public let softwareRevisionStringUUID                         = CBUUID(string: "2A28")
	static public let manufacturerNameStringUUID                         = CBUUID(string: "2A29")
	static public let IEEE11073_20601RegulatoryCertificationDataListUUID = CBUUID(string: "2A2A")
	static public let currentTimeUUID                                    = CBUUID(string: "2A2B")
	static public let magneticDeclinationUUID                            = CBUUID(string: "2A2C")
	static public let scanRefreshUUID                                    = CBUUID(string: "2A31")
	static public let bootKeyboardOutputReportUUID                       = CBUUID(string: "2A32")
	static public let bootMouseInputReportUUID                           = CBUUID(string: "2A33")
	static public let glucoseMeasurementContextUUID                      = CBUUID(string: "2A34")
	static public let bloodPressureMeasurementUUID                       = CBUUID(string: "2A35")
	static public let intermediateCuffPressureUUID                       = CBUUID(string: "2A36")
	static public let heartRateMeasurementUUID                           = CBUUID(string: "2A37")
	static public let bodySensorLocationUUID                             = CBUUID(string: "2A38")
	static public let heartRateControlPointUUID                          = CBUUID(string: "2A39")
	static public let alertStatusUUID                                    = CBUUID(string: "2A3F")
	static public let ringerControlPointUUID                             = CBUUID(string: "2A40")
	static public let ringerSettingUUID                                  = CBUUID(string: "2A41")
	static public let alertCategoryIDBitMaskUUID                         = CBUUID(string: "2A42")
	static public let alertCategoryIDUUID                                = CBUUID(string: "2A43")
	static public let alertNotificationControlPointUUID                  = CBUUID(string: "2A44")
	static public let unreadAlertStatusUUID                              = CBUUID(string: "2A45")
	static public let newAlertUUID                                       = CBUUID(string: "2A46")
	static public let supportedNewAlertCategoryUUID                      = CBUUID(string: "2A47")
	static public let supportedUnreadAlertCategoryUUID                   = CBUUID(string: "2A48")
	static public let bloodPressureFeatureUUID                           = CBUUID(string: "2A49")
	static public let HIDInformationUUID                                 = CBUUID(string: "2A4A")
	static public let reportMapUUID                                      = CBUUID(string: "2A4B")
	static public let HIDControlPointUUID                                = CBUUID(string: "2A4C")
	static public let reportUUID                                         = CBUUID(string: "2A4D")
	static public let protocolModeUUID                                   = CBUUID(string: "2A4E")
	static public let scanIntervalWindowUUID                             = CBUUID(string: "2A4F")
	static public let PnPIDUUID                                          = CBUUID(string: "2A50")
	static public let glucoseFeatureUUID                                 = CBUUID(string: "2A51")
	static public let recordAccessControlPointUUID                       = CBUUID(string: "2A52")
	static public let RSCMeasurementUUID                                 = CBUUID(string: "2A53")
	static public let RSCFeatureUUID                                     = CBUUID(string: "2A54")
	static public let SCControlPointUUID                                 = CBUUID(string: "2A55")
	static public let digitalUUID                                        = CBUUID(string: "2A56")
	static public let analogUUID                                         = CBUUID(string: "2A58")
	static public let aggregateUUID                                      = CBUUID(string: "2A5A")
	static public let CSCMeasurementUUID                                 = CBUUID(string: "2A5B")
	static public let CSCFeatureUUID                                     = CBUUID(string: "2A5C")
	static public let sensorLocationUUID                                 = CBUUID(string: "2A5D")
	static public let PLXSpotCheckMeasurementUUID                        = CBUUID(string: "2A5E")
	static public let PLXContinuousMeasurementUUID                       = CBUUID(string: "2A5F")
	static public let PLXFeaturesUUID                                    = CBUUID(string: "2A60")
	static public let cyclingPowerMeasurementUUID                        = CBUUID(string: "2A63")
	static public let cyclingPowerVectorUUID                             = CBUUID(string: "2A64")
	static public let cyclingPowerFeatureUUID                            = CBUUID(string: "2A65")
	static public let cyclingPowerControlPointUUID                       = CBUUID(string: "2A66")
	static public let locationAndSpeedUUID                               = CBUUID(string: "2A67")
	static public let navigationUUID                                     = CBUUID(string: "2A68")
	static public let positionQualityUUID                                = CBUUID(string: "2A69")
	static public let LNFeatureUUID                                      = CBUUID(string: "2A6A")
	static public let LNControlPointUUID                                 = CBUUID(string: "2A6B")
	static public let elevationUUID                                      = CBUUID(string: "2A6C")
	static public let pressureUUID                                       = CBUUID(string: "2A6D")
	static public let temperatureUUID                                    = CBUUID(string: "2A6E")
	static public let humidityUUID                                       = CBUUID(string: "2A6F")
	static public let trueWindSpeedUUID                                  = CBUUID(string: "2A70")
	static public let trueWindDirectionUUID                              = CBUUID(string: "2A71")
	static public let apparentWindSpeedUUID                              = CBUUID(string: "2A72")
	static public let apparentWindDirectionUUID                          = CBUUID(string: "2A73")
	static public let gustFactorUUID                                     = CBUUID(string: "2A74")
	static public let pollenConcentrationUUID                            = CBUUID(string: "2A75")
	static public let UVIndexUUID                                        = CBUUID(string: "2A76")
	static public let irradianceUUID                                     = CBUUID(string: "2A77")
	static public let rainfallUUID                                       = CBUUID(string: "2A78")
	static public let windChillUUID                                      = CBUUID(string: "2A79")
	static public let heatIndexUUID                                      = CBUUID(string: "2A7A")
	static public let dewPointUUID                                       = CBUUID(string: "2A7B")
	static public let descriptorValueChangedUUID                         = CBUUID(string: "2A7D")
	static public let aerobicHeartRateLowerLimitUUID                     = CBUUID(string: "2A7E")
	static public let aerobicThresholdUUID                               = CBUUID(string: "2A7F")
	static public let ageUUID                                            = CBUUID(string: "2A80")
	static public let anaerobicHeartRateLowerLimitUUID                   = CBUUID(string: "2A81")
	static public let anaerobicHeartRateUpperLimitUUID                   = CBUUID(string: "2A82")
	static public let anaerobicThresholdUUID                             = CBUUID(string: "2A83")
	static public let aerobicHeartRateUpperLimitUUID                     = CBUUID(string: "2A84")
	static public let dateOfBirthUUID                                    = CBUUID(string: "2A85")
	static public let dateOfThresholdAssessmentUUID                      = CBUUID(string: "2A86")
	static public let emailAddressUUID                                   = CBUUID(string: "2A87")
	static public let fatHeartRateLowerLimitUUID                         = CBUUID(string: "2A88")
	static public let fatBurnHeartRateUpperLimitUUID                     = CBUUID(string: "2A89")
	static public let firstNameUUID                                      = CBUUID(string: "2A8A")
	static public let fiveZoneHeartRateLimitsUUID                        = CBUUID(string: "2A8B")
	static public let genderUUID                                         = CBUUID(string: "2A8C")
	static public let heartRateMaxUUID                                   = CBUUID(string: "2A8D")
	static public let heightUUID                                         = CBUUID(string: "2A8E")
	static public let hipCircumferenceUUID                               = CBUUID(string: "2A8F")
	static public let lastNameUUID                                       = CBUUID(string: "2A90")
	static public let maximumRecommendedHeartRateUUID                    = CBUUID(string: "2A91")
	static public let restingHeartRateUUID                               = CBUUID(string: "2A92")
	static public let sportTypeforAerobicandAnaerobicThresholdsUUID      = CBUUID(string: "2A93")
	static public let threeZoneHeartRateLimitsUUID                       = CBUUID(string: "2A94")
	static public let twoZoneHeartRateLimitUUID                          = CBUUID(string: "2A95")
	static public let VO2MaxUUID                                         = CBUUID(string: "2A96")
	static public let waistCircumferenceUUID                             = CBUUID(string: "2A97")
	static public let weightUUID                                         = CBUUID(string: "2A98")
	static public let databaseChangeIncrementUUID                        = CBUUID(string: "2A99")
	static public let userIndexUUID                                      = CBUUID(string: "2A9A")
	static public let bodyCompositionFeatureUUID                         = CBUUID(string: "2A9B")
	static public let bodyCompositionMeasurementUUID                     = CBUUID(string: "2A9C")
	static public let weightMeasurementUUID                              = CBUUID(string: "2A9D")
	static public let weightScaleFeatureUUID                             = CBUUID(string: "2A9E")
	static public let userControlPointUUID                               = CBUUID(string: "2A9F")
	static public let magneticFluxDensity2DUUID                          = CBUUID(string: "2AA0")
	static public let magneticFluxDensity3DUUID                          = CBUUID(string: "2AA1")
	static public let languageUUID                                       = CBUUID(string: "2AA2")
	static public let barometricPressureTrendUUID                        = CBUUID(string: "2AA3")
	static public let bondManagementControlPointUUID                     = CBUUID(string: "2AA4")
	static public let bondManagementFeatureUUID                          = CBUUID(string: "2AA5")
	static public let centralAddressResolutionUUID                       = CBUUID(string: "2AA6")
	static public let CGMMeasurementUUID                                 = CBUUID(string: "2AA7")
	static public let CGMFeatureUUID                                     = CBUUID(string: "2AA8")
	static public let CGMStatusUUID                                      = CBUUID(string: "2AA9")
	static public let CGMSessionStartTimeUUID                            = CBUUID(string: "2AAA")
	static public let CGMSessionRunTimeUUID                              = CBUUID(string: "2AAB")
	static public let CGMSpecificOpsControlPointUUID                     = CBUUID(string: "2AAC")
	static public let indoorPositioningConfigurationUUID                 = CBUUID(string: "2AAD")
	static public let latitudeUUID                                       = CBUUID(string: "2AAE")
	static public let longitudeUUID                                      = CBUUID(string: "2AAF")
	static public let localNorthCoordinateUUID                           = CBUUID(string: "2AB0")
	static public let localEastCoordinateUUID                            = CBUUID(string: "2AB1")
	static public let floorNumberUUID                                    = CBUUID(string: "2AB2")
	static public let altitudeUUID                                       = CBUUID(string: "2AB3")
	static public let uncertaintyUUID                                    = CBUUID(string: "2AB4")
	static public let locationNameUUID                                   = CBUUID(string: "2AB5")
	static public let URIUUID                                            = CBUUID(string: "2AB6")
	static public let HTTPHeadersUUID                                    = CBUUID(string: "2AB7")
	static public let HTTPStatusCodeUUID                                 = CBUUID(string: "2AB8")
	static public let HTTPEntityBodyUUID                                 = CBUUID(string: "2AB9")
	static public let HTTPControlPointUUID                               = CBUUID(string: "2ABA")
	static public let HTTPSSecurityUUID                                  = CBUUID(string: "2ABB")
	static public let TDSControlPointUUID                                = CBUUID(string: "2ABC")
	static public let OTSFeatureUUID                                     = CBUUID(string: "2ABD")
	static public let objectNameUUID                                     = CBUUID(string: "2ABE")
	static public let objectTypeUUID                                     = CBUUID(string: "2ABF")
	static public let objectSizeUUID                                     = CBUUID(string: "2AC0")
	static public let objectFirstCreatedUUID                             = CBUUID(string: "2AC1")
	static public let objectLastModifiedUUID                             = CBUUID(string: "2AC2")
	static public let objectIDUUID                                       = CBUUID(string: "2AC3")
	static public let objectPropertiesUUID                               = CBUUID(string: "2AC4")
	static public let objectActionControlPointUUID                       = CBUUID(string: "2AC5")
	static public let objectListControlPointUUID                         = CBUUID(string: "2AC6")
	static public let objectListFilterUUID                               = CBUUID(string: "2AC7")
	static public let objectChangedUUID                                  = CBUUID(string: "2AC8")
    static public let resolvablePrivateAddressOnlyUUID                   = CBUUID(string: "2AC9")
    static public let fitnessMachineFeatureUUID                          = CBUUID(string: "2ACC")
    static public let treadmillDataUUID                                  = CBUUID(string: "2ACD")
    static public let crossTrainerDataUUID                               = CBUUID(string: "2ACE")
    static public let stepClimberDataUUID                                = CBUUID(string: "2ACF")
    static public let stairClimberDataUUID                               = CBUUID(string: "2AD0")
    static public let rowerDataUUID                                      = CBUUID(string: "2AD1")
    static public let indoorBikeDataUUID                                 = CBUUID(string: "2AD2")
    static public let trainingStatusUUID                                 = CBUUID(string: "2AD3")
    static public let supportedSpeedRangeUUID                            = CBUUID(string: "2AD4")
    static public let supportedInclinationRangeUUID                      = CBUUID(string: "2AD5")
    static public let supportedResistanceLevelRangeUUID                  = CBUUID(string: "2AD6")
    static public let supportedHeartRateRangeUUID                        = CBUUID(string: "2AD7")
    static public let supportedPowerRangeUUID                            = CBUUID(string: "2AD8")
    static public let fitnessMachineControlPointUUID                     = CBUUID(string: "2AD9")
    static public let fitnessMachineStatusUUID                           = CBUUID(string: "2ADA")
    static public let dateUTCUUID                                        = CBUUID(string: "2AED")
    static public let RCFeatureUUID                                      = CBUUID(string: "2B1D")
    static public let RCSettingsUUID                                     = CBUUID(string: "2B1E")
    static public let reconnectionConfigurationControlPointUUID          = CBUUID(string: "2B1F")
    static public let IDDStatusChangedUUID                               = CBUUID(string: "2B20")
    static public let IDDStatusUUID                                      = CBUUID(string: "2B21")
    static public let IDDAnnunciationStatusUUID                          = CBUUID(string: "2B22")
    static public let IDDFeaturesUUID                                    = CBUUID(string: "2B23")
    static public let IDDStatusReaderControlPointUUID                    = CBUUID(string: "2B24")
    static public let IDDCommandControlPointUUID                         = CBUUID(string: "2B25")
    static public let IDDCommandDataUUID                                 = CBUUID(string: "2B26")
    static public let IDDRecordAccessControlPointUUID                    = CBUUID(string: "2B27")
    static public let IDDHistoryDataUUID                                 = CBUUID(string: "2B28")
}

/**
 The standard descriptors UUID define in the `Bluetooth Developer Portal` website.
 It will be used to create the standard characteristic and otain the standard characteristic name.
 */
extension CBUUID {
    static public let characteristicExtendedPropertiesUUID              = CBUUID(string: "2900")
    static public let characteristicUserDescriptionUUID                 = CBUUID(string: "2901")
    static public let clientCharacteristicConfigurationUUID             = CBUUID(string: "2902")
    static public let serverCharacteristicConfigurationUUID             = CBUUID(string: "2903")
    static public let characteristicPresentationFormatUUID              = CBUUID(string: "2904")
    static public let characteristicAggregateFormatUUID                 = CBUUID(string: "2905")
    static public let validRangeUUID                                    = CBUUID(string: "2906")
    static public let externalReportReferenceUUID                       = CBUUID(string: "2907")
    static public let reportReferenceUUID                               = CBUUID(string: "2908")
    static public let numberofDigitalsUUID                              = CBUUID(string: "2909")
    static public let valueTriggerSettingUUID                           = CBUUID(string: "290A")
    static public let environmentalSensingConfigurationUUID             = CBUUID(string: "290B")
    static public let environmentalSensingMeasurementUUID               = CBUUID(string: "290C")
    static public let environmentalSensingTriggerSettingUUID            = CBUUID(string: "290D")
    static public let timeTriggerSettingUUID                            = CBUUID(string: "290E")

}

extension CBUUID {
    
    /**
     Obtain the UUID name
     If the UUID is the standard service UUID return the standard name
     If not, return the UUIDString as the name.
     */
    public var name : String? {
        if self == CBUUID.genericAccessUUID {
            return "Generic Access"
        } else if self == CBUUID.genericAttributeUUID {
            return "Generic Attribute"
        } else if self == CBUUID.immediateAlertUUID {
            return "Immediate Alert"
        } else if self == CBUUID.linkLossUUID {
            return "Link Loss"
        } else if self == CBUUID.txPowerUUID {
            return "Tx Power"
        } else if self == CBUUID.currentTimeServiceUUID {
            return "Current Time Service"
        } else if self == CBUUID.referenceTimeUpdateServiceUUID {
            return "Reference Time Update Service"
        } else if self == CBUUID.nextDSTChangeServiceUUID {
            return "Next DST Change Service"
        } else if self == CBUUID.glucoseUUID {
            return "Glucose"
        } else if self == CBUUID.healthThermometerUUID {
            return "Health Thermometer"
        } else if self == CBUUID.deviceInformationUUID {
            return "Device Information"
        } else if self == CBUUID.heartRateUUID {
            return "Heart Rate"
        } else if self == CBUUID.phoneAlertStatusServiceUUID {
            return "Phone Alert Status Service"
        } else if self == CBUUID.batterServiceUUID {
            return "Batter Service"
        } else if self == CBUUID.bloodPressureUUID {
            return "Blood Pressure"
        } else if self == CBUUID.alertNotificationUUID {
            return "Alert Notification"
        } else if self == CBUUID.humanInterfaceDeviceUUID {
            return "Human Interface Device"
        } else if self == CBUUID.scanParametersUUID {
            return "Scan Parameters"
        } else if self == CBUUID.runningSpeedAndCadenceUUID {
            return "Running Speed And Cadence"
        } else if self == CBUUID.automationIOUUID {
            return "Automation IO"
        } else if self == CBUUID.cyclingSpeedAndCadenceUUID {
            return "Cycling Speed And Cadence"
        } else if self == CBUUID.cyclingPowerUUID {
            return "Cycling Power"
        } else if self == CBUUID.locationAndNavigationUUID {
            return "Location And Navigation"
        } else if self == CBUUID.environmentalSensingUUID {
            return "Environmental Sensing"
        } else if self == CBUUID.bodyCompositionUUID {
            return "Body Composition"
        } else if self == CBUUID.userDataUUID {
            return "User Data"
        } else if self == CBUUID.weightScaleUUID {
            return "Weight Scale"
        } else if self == CBUUID.bondManagementUUID {
            return "Bond Management"
        } else if self == CBUUID.continuousGlucoseMonitoringUUID {
            return "Continuous Glucose Monitoring"
        } else if self == CBUUID.internetProtocolSupportUUID {
            return "Internet Protocol Support"
        } else if self == CBUUID.indoorPositioningUUID {
            return "Indoor Positioning"
        } else if self == CBUUID.pulseOximeterUUID {
            return "Pulse Oximeter"
        } else if self == CBUUID.httpProxyUUID {
            return "Http Proxy"
        } else if self == CBUUID.transportDiscoveryUUID {
            return "Transport Discovery"
        } else if self == CBUUID.objectTransferUUID {
            return "Object Transfer"
        } else if self == CBUUID.fitnessMachineUUID {
            return "itness Machine"
        } else if self == CBUUID.meshProvisioningServiceUUID {
            return "Mesh Provisioning Service"
        } else if self == CBUUID.meshProxyServiceUUID {
            return "Mesh Proxy Service"
        } else if self == CBUUID.reconnectionConfigurationUUID {
            return "Reconnection Configuration"
        } else if self == CBUUID.insulinDeliveryUUID {
            return "Insulin Delivery"
        } else if self == CBUUID.deviceNameUUID {
            return "Device Name"
        } else if self == CBUUID.appearanceUUID {
            return "Appearance"
        } else if self == CBUUID.peripheralPrivacyFlagUUID {
            return "Peripheral Privacy Flag"
        } else if self == CBUUID.reconnectionAddressUUID {
            return "Reconnection Address"
        } else if self == CBUUID.peripheralPreferredConnectionParametersUUID {
            return "Peripheral Preferred Connection Parameters"
        } else if self == CBUUID.serviceChangedUUID {
            return "Service Changed"
        } else if self == CBUUID.alertLevelUUID {
            return "Alert Level"
        } else if self == CBUUID.txPowerLevelUUID {
            return "Tx Power Level"
        } else if self == CBUUID.dateTimeUUID {
            return "Date Time"
        } else if self == CBUUID.dayOfWeekUUID {
            return "Day Of Week"
        } else if self == CBUUID.dayDateTimeUUID {
            return "Day Date Time"
        } else if self == CBUUID.exactTime256UUID {
            return "Exact Time 256"
        } else if self == CBUUID.DSTOffsetUUID {
            return "DST Offset"
        } else if self == CBUUID.timeZoneUUID {
            return "Time Zone"
        } else if self == CBUUID.localTimeInformationUUID {
            return "Local Time Information"
        } else if self == CBUUID.timeWithDSTUUID {
            return "Time With DST"
        } else if self == CBUUID.timeAccuracyUUID {
            return "Time Accuracy"
        } else if self == CBUUID.timeSourceUUID {
            return "Time Source"
        } else if self == CBUUID.referenceTimeInformationUUID {
            return "Reference Time Information"
        } else if self == CBUUID.timeUpdateControlPointUUID {
            return "Time Update Control Point"
        } else if self == CBUUID.timeUpdateStateUUID {
            return "Time Update State"
        } else if self == CBUUID.glucoseMeasurementUUID {
            return "Glucose Measurement"
        } else if self == CBUUID.batteryLevelUUID {
            return "Battery Level"
        } else if self == CBUUID.temperatureMeasurementUUID {
            return "Temperature Measurement"
        } else if self == CBUUID.temperatureTypeUUID {
            return "Temperature Type"
        } else if self == CBUUID.intermediateTemperatureUUID {
            return "Intermediate Temperature"
        } else if self == CBUUID.measurementIntervalUUID {
            return "Measurement Interval"
        } else if self == CBUUID.bootKeyboardInputReportUUID {
            return "Boot Keyboard Input Report"
        } else if self == CBUUID.systemIDUUID {
            return "System ID"
        } else if self == CBUUID.modelNumberStringUUID {
            return "Model Number String"
        } else if self == CBUUID.serialNumberStringUUID {
            return "Serial Number String"
        } else if self == CBUUID.firmwareRevisionStringUUID {
            return "Firmware Revision String"
        } else if self == CBUUID.hardwareRevisionStringUUID {
            return "Hardware Revision String"
        } else if self == CBUUID.softwareRevisionStringUUID {
            return "Software Revision String"
        } else if self == CBUUID.manufacturerNameStringUUID {
            return "Manufacturer Name String"
        } else if self == CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID {
            return "IEEE11073-20601 Regulatory Certification Data List"
        } else if self == CBUUID.currentTimeUUID {
            return "Current Time"
        } else if self == CBUUID.magneticDeclinationUUID {
            return "Magnetic Declination"
        } else if self == CBUUID.scanRefreshUUID {
            return "Scan Refresh"
        } else if self == CBUUID.bootKeyboardOutputReportUUID {
            return "Boot Keyboard Output Report"
        } else if self == CBUUID.bootMouseInputReportUUID {
            return "Boot Mouse Input Report"
        } else if self == CBUUID.glucoseMeasurementContextUUID {
            return "Glucose Measurement Context"
        } else if self == CBUUID.bloodPressureMeasurementUUID {
            return "Blood Pressure Measurement"
        } else if self == CBUUID.intermediateCuffPressureUUID {
            return "Intermediate Cuff Pressure"
        } else if self == CBUUID.heartRateMeasurementUUID {
            return "Heart Rate Measurement"
        } else if self == CBUUID.bodySensorLocationUUID {
            return "Body Sensor Location"
        } else if self == CBUUID.heartRateControlPointUUID {
            return "Heart Rate Control Point"
        } else if self == CBUUID.alertStatusUUID {
            return "Alert Status"
        } else if self == CBUUID.ringerControlPointUUID {
            return "Ringer Control Point"
        } else if self == CBUUID.ringerSettingUUID {
            return "Ringer Setting"
        } else if self == CBUUID.alertCategoryIDBitMaskUUID {
            return "Alert Category ID Bit Mask"
        } else if self == CBUUID.alertCategoryIDUUID {
            return "Alert Category ID"
        } else if self == CBUUID.alertNotificationControlPointUUID {
            return "Alert Notification Control Point"
        } else if self == CBUUID.unreadAlertStatusUUID {
            return "Unread Alert Status"
        } else if self == CBUUID.newAlertUUID {
            return "New Alert"
        } else if self == CBUUID.supportedNewAlertCategoryUUID {
            return "Supported New Alert Category"
        } else if self == CBUUID.supportedUnreadAlertCategoryUUID {
            return "Supported Unread Alert Category"
        } else if self == CBUUID.bloodPressureFeatureUUID {
            return "Blood Pressure Feature"
        } else if self == CBUUID.HIDInformationUUID {
            return "HID Information"
        } else if self == CBUUID.reportMapUUID {
            return "Report Map"
        } else if self == CBUUID.HIDControlPointUUID {
            return "HID Control Point"
        } else if self == CBUUID.reportUUID {
            return "Report"
        } else if self == CBUUID.protocolModeUUID {
            return "Protocol Mode"
        } else if self == CBUUID.scanIntervalWindowUUID {
            return "Scan Interval Window"
        } else if self == CBUUID.PnPIDUUID {
            return "Pn PID"
        } else if self == CBUUID.glucoseFeatureUUID {
            return "Glucose Feature"
        } else if self == CBUUID.recordAccessControlPointUUID {
            return "Record Access Control Point"
        } else if self == CBUUID.RSCMeasurementUUID {
            return "RSC Measurement"
        } else if self == CBUUID.RSCFeatureUUID {
            return "RSC Feature"
        } else if self == CBUUID.SCControlPointUUID {
            return "SC Control Point"
        } else if self == CBUUID.digitalUUID {
            return "Digital"
        } else if self == CBUUID.analogUUID {
            return "Analog"
        } else if self == CBUUID.aggregateUUID {
            return "Aggregate"
        } else if self == CBUUID.CSCMeasurementUUID {
            return "CSC Measurement"
        } else if self == CBUUID.CSCFeatureUUID {
            return "CSC Feature"
        } else if self == CBUUID.sensorLocationUUID {
            return "Sensor Location"
        } else if self == CBUUID.PLXSpotCheckMeasurementUUID {
            return "PLX Spot-Check Measurement"
        } else if self == CBUUID.PLXContinuousMeasurementUUID {
            return "PLX Continuous Measurement"
        } else if self == CBUUID.PLXFeaturesUUID {
            return "PLX Features"
        } else if self == CBUUID.cyclingPowerMeasurementUUID {
            return "Cycling Power Measurement"
        } else if self == CBUUID.cyclingPowerVectorUUID {
            return "Cycling Power Vector"
        } else if self == CBUUID.cyclingPowerFeatureUUID {
            return "Cycling Power Feature"
        } else if self == CBUUID.cyclingPowerControlPointUUID {
            return "Cycling Power Control Point"
        } else if self == CBUUID.locationAndSpeedUUID {
            return "Location AndSpeed"
        } else if self == CBUUID.navigationUUID {
            return "Navigation"
        } else if self == CBUUID.positionQualityUUID {
            return "Position Quality"
        } else if self == CBUUID.LNFeatureUUID {
            return "LN Feature"
        } else if self == CBUUID.LNControlPointUUID {
            return "LN Control Point"
        } else if self == CBUUID.elevationUUID {
            return "Elevation"
        } else if self == CBUUID.pressureUUID {
            return "Pressure"
        } else if self == CBUUID.temperatureUUID {
            return "Temperature"
        } else if self == CBUUID.humidityUUID {
            return "Humidity"
        } else if self == CBUUID.trueWindSpeedUUID {
            return "True Wind Speed"
        } else if self == CBUUID.trueWindDirectionUUID {
            return "True Wind Direction"
        } else if self == CBUUID.apparentWindSpeedUUID {
            return "Apparent Wind Speed"
        } else if self == CBUUID.apparentWindDirectionUUID {
            return "Apparent Wind Direction"
        } else if self == CBUUID.gustFactorUUID {
            return "Gust Factor"
        } else if self == CBUUID.pollenConcentrationUUID {
            return "Pollen Concentration"
        } else if self == CBUUID.UVIndexUUID {
            return "UVIndex"
        } else if self == CBUUID.irradianceUUID {
            return "Irradiance"
        } else if self == CBUUID.rainfallUUID {
            return "Rainfall"
        } else if self == CBUUID.windChillUUID {
            return "Wind Chill"
        } else if self == CBUUID.heatIndexUUID {
            return "Heat Index"
        } else if self == CBUUID.dewPointUUID {
            return "Dew Point"
        } else if self == CBUUID.descriptorValueChangedUUID {
            return "Descriptor Value Changed"
        } else if self == CBUUID.aerobicHeartRateLowerLimitUUID {
            return "Aerobic Heart Rate Lower Limit"
        } else if self == CBUUID.aerobicThresholdUUID {
            return "Aerobic Threshold"
        } else if self == CBUUID.ageUUID {
            return "Age"
        } else if self == CBUUID.anaerobicHeartRateLowerLimitUUID {
            return "Anaerobic Heart Rate Lower Limit"
        } else if self == CBUUID.anaerobicHeartRateUpperLimitUUID {
            return "Anaerobic Heart Rate Upper Limit"
        } else if self == CBUUID.anaerobicThresholdUUID {
            return "Anaerobic Threshold"
        } else if self == CBUUID.aerobicHeartRateUpperLimitUUID {
            return "Aerobic Heart Rate Upper Limit"
        } else if self == CBUUID.dateOfBirthUUID {
            return "Date Of Birth"
        } else if self == CBUUID.dateOfThresholdAssessmentUUID {
            return "Date Of Threshold Assessment"
        } else if self == CBUUID.emailAddressUUID {
            return "Email Address"
        } else if self == CBUUID.fatHeartRateLowerLimitUUID {
            return "Fat Heart Rate Lower Limit"
        } else if self == CBUUID.fatBurnHeartRateUpperLimitUUID {
            return "Fat Burn Heart Rate Upper Limit"
        } else if self == CBUUID.firstNameUUID {
            return "First Name"
        } else if self == CBUUID.fiveZoneHeartRateLimitsUUID {
            return "Five Zone Heart Rate Limits"
        } else if self == CBUUID.genderUUID {
            return "Gender"
        } else if self == CBUUID.heartRateMaxUUID {
            return "Heart Rate Max"
        } else if self == CBUUID.heightUUID {
            return "Height"
        } else if self == CBUUID.hipCircumferenceUUID {
            return "Hip Circumference"
        } else if self == CBUUID.lastNameUUID {
            return "Last Name"
        } else if self == CBUUID.maximumRecommendedHeartRateUUID {
            return "Maximum Recommended HeartRate"
        } else if self == CBUUID.restingHeartRateUUID {
            return "Resting Heart Rate"
        } else if self == CBUUID.sportTypeforAerobicandAnaerobicThresholdsUUID {
            return "Sport Type for Aerobicand Anaerobic Thresholds"
        } else if self == CBUUID.threeZoneHeartRateLimitsUUID {
            return "Three Zone Heart Rate Limits"
        } else if self == CBUUID.twoZoneHeartRateLimitUUID {
            return "Two Zone Heart Rate Limit"
        } else if self == CBUUID.VO2MaxUUID {
            return "VO2Max"
        } else if self == CBUUID.waistCircumferenceUUID {
            return "Waist Circumference"
        } else if self == CBUUID.weightUUID {
            return "Weight"
        } else if self == CBUUID.databaseChangeIncrementUUID {
            return "Database Change Increment"
        } else if self == CBUUID.userIndexUUID {
            return "User Index"
        } else if self == CBUUID.bodyCompositionFeatureUUID {
            return "Body Composition Feature"
        } else if self == CBUUID.bodyCompositionMeasurementUUID {
            return "Body Composition Measurement"
        } else if self == CBUUID.weightMeasurementUUID {
            return "Weight Measurement"
        } else if self == CBUUID.weightScaleFeatureUUID {
            return "Weight Scale Feature"
        } else if self == CBUUID.userControlPointUUID {
            return "User Control Point"
        } else if self == CBUUID.magneticFluxDensity2DUUID {
            return "Magnetic Flux Density 2D"
        } else if self == CBUUID.magneticFluxDensity3DUUID {
            return "Magnetic Flux Density 3D"
        } else if self == CBUUID.languageUUID {
            return "Language"
        } else if self == CBUUID.barometricPressureTrendUUID {
            return "Barometric Pressure Trend"
        } else if self == CBUUID.bondManagementControlPointUUID {
            return "Bond Management Control Point"
        } else if self == CBUUID.bondManagementFeatureUUID {
            return "Bond Management Feature"
        } else if self == CBUUID.centralAddressResolutionUUID {
            return "Central Address Resolution"
        } else if self == CBUUID.CGMMeasurementUUID {
            return "CGM Measurement"
        } else if self == CBUUID.CGMFeatureUUID {
            return "CGM Feature"
        } else if self == CBUUID.CGMStatusUUID {
            return "CGM Status"
        } else if self == CBUUID.CGMSessionStartTimeUUID {
            return "CGM Session Start Time"
        } else if self == CBUUID.CGMSessionRunTimeUUID {
            return "CGM Session Run Time"
        } else if self == CBUUID.CGMSpecificOpsControlPointUUID {
            return "CGM Specific Ops Control Point"
        } else if self == CBUUID.indoorPositioningConfigurationUUID {
            return "Indoor Positioning Configuration"
        } else if self == CBUUID.latitudeUUID {
            return "Latitude"
        } else if self == CBUUID.longitudeUUID {
            return "Longitude"
        } else if self == CBUUID.localNorthCoordinateUUID {
            return "Local North Coordinate"
        } else if self == CBUUID.localEastCoordinateUUID {
            return "Local East Coordinate"
        } else if self == CBUUID.floorNumberUUID {
            return "Floor Number"
        } else if self == CBUUID.altitudeUUID {
            return "Altitude"
        } else if self == CBUUID.uncertaintyUUID {
            return "Uncertainty"
        } else if self == CBUUID.locationNameUUID {
            return "Location Name"
        } else if self == CBUUID.URIUUID {
            return "URI"
        } else if self == CBUUID.HTTPHeadersUUID {
            return "HTTP Headers"
        } else if self == CBUUID.HTTPStatusCodeUUID {
            return "HTTP StatusCode"
        } else if self == CBUUID.HTTPEntityBodyUUID {
            return "HTTP EntityBody"
        } else if self == CBUUID.HTTPControlPointUUID {
            return "HTTP ControlPoint"
        } else if self == CBUUID.HTTPSSecurityUUID {
            return "HTTPS Security"
        } else if self == CBUUID.TDSControlPointUUID {
            return "TDS Control Point"
        } else if self == CBUUID.OTSFeatureUUID {
            return "OTS Feature"
        } else if self == CBUUID.objectNameUUID {
            return "Object Name"
        } else if self == CBUUID.objectTypeUUID {
            return "ObjectType"
        } else if self == CBUUID.objectSizeUUID {
            return "Object Size"
        } else if self == CBUUID.objectFirstCreatedUUID {
            return "Object First-Created"
        } else if self == CBUUID.objectLastModifiedUUID {
            return "Object Last-Modified"
        } else if self == CBUUID.objectIDUUID {
            return "Object ID"
        } else if self == CBUUID.objectPropertiesUUID {
            return "Object Properties"
        } else if self == CBUUID.objectActionControlPointUUID {
            return "Object Action Control Point"
        } else if self == CBUUID.objectListControlPointUUID {
            return "ObjectList Control Point"
        } else if self == CBUUID.objectListFilterUUID {
            return "Object List Filter"
        } else if self == CBUUID.objectChangedUUID {
            return "Object Changed"
        } else if self == CBUUID.resolvablePrivateAddressOnlyUUID {
            return "Resolvable Private Address Only"
        } else if self == CBUUID.fitnessMachineFeatureUUID {
            return "Fitness Machine Feature"
        } else if self == CBUUID.treadmillDataUUID {
            return "Treadmill Data"
        } else if self == CBUUID.crossTrainerDataUUID {
            return "Cross Trainer Data"
        } else if self == CBUUID.stepClimberDataUUID {
            return "Step Climber Data"
        } else if self == CBUUID.stairClimberDataUUID {
            return "Stair Climber Data"
        } else if self == CBUUID.rowerDataUUID {
            return "Rower Data"
        } else if self == CBUUID.indoorBikeDataUUID {
            return "Indoor Bike Data"
        } else if self == CBUUID.trainingStatusUUID {
            return "Training Status"
        } else if self == CBUUID.supportedSpeedRangeUUID {
            return "Supported Speed Range"
        } else if self == CBUUID.supportedInclinationRangeUUID {
            return "Supported Inclination Range"
        } else if self == CBUUID.supportedResistanceLevelRangeUUID {
            return "Supported Resistance Level Range"
        } else if self == CBUUID.supportedHeartRateRangeUUID {
            return "Supported Heart Rate Range"
        } else if self == CBUUID.supportedPowerRangeUUID {
            return "Supported Power Range"
        } else if self == CBUUID.fitnessMachineControlPointUUID {
            return "Fitness Machine Control Point"
        } else if self == CBUUID.fitnessMachineStatusUUID {
            return "Fitness Machine Status"
        } else if self == CBUUID.dateUTCUUID {
            return "Date UTC"
        } else if self == CBUUID.RCFeatureUUID {
            return "RC Feature"
        } else if self == CBUUID.RCSettingsUUID {
            return "RC Settings"
        } else if self == CBUUID.reconnectionConfigurationControlPointUUID {
            return "Reconnection Configuration Control Point"
        } else if self == CBUUID.IDDStatusChangedUUID {
            return "IDD Status Changed"
        } else if self == CBUUID.IDDStatusUUID {
            return "IDD Status"
        } else if self == CBUUID.IDDAnnunciationStatusUUID {
            return "IDD Annunciation Status"
        } else if self == CBUUID.IDDFeaturesUUID {
            return "IDD Features"
        } else if self == CBUUID.IDDStatusReaderControlPointUUID {
            return "IDD Status Reader Control Point"
        } else if self == CBUUID.IDDCommandControlPointUUID {
            return "IDD Command Control Point"
        } else if self == CBUUID.IDDCommandDataUUID {
            return "IDD Command Data"
        } else if self == CBUUID.IDDRecordAccessControlPointUUID {
            return "IDD Record Access Control Point"
        } else if self == CBUUID.IDDHistoryDataUUID {
            return "IDD History Data"
        } else if self == CBUUID.characteristicExtendedPropertiesUUID {
            return "Characteristic Extended Properties"
        } else if self == CBUUID.characteristicUserDescriptionUUID {
            return "Characteristic User Description"
        } else if self == CBUUID.clientCharacteristicConfigurationUUID {
            return "Client Characteristic Configuration"
        } else if self == CBUUID.serverCharacteristicConfigurationUUID {
            return "Server Characteristic Configuration"
        } else if self == CBUUID.characteristicPresentationFormatUUID {
            return "Characteristic Presentation Format"
        } else if self == CBUUID.characteristicAggregateFormatUUID {
            return "Characteristic Aggregate Format"
        } else if self == CBUUID.validRangeUUID {
            return "Valid Range"
        } else if self == CBUUID.externalReportReferenceUUID {
            return "External Report Reference"
        } else if self == CBUUID.reportReferenceUUID {
            return "Report Reference"
        } else if self == CBUUID.numberofDigitalsUUID {
            return "Number of Digitals"
        } else if self == CBUUID.valueTriggerSettingUUID {
            return "Value Trigger Setting"
        } else if self == CBUUID.environmentalSensingConfigurationUUID {
            return "Environmental Sensing Configuration"
        } else if self == CBUUID.environmentalSensingMeasurementUUID {
            return "Environmental Sensing Measurement"
        } else if self == CBUUID.environmentalSensingTriggerSettingUUID {
            return "Environmental Sensing Trigger Setting"
        } else if self == CBUUID.timeTriggerSettingUUID {
            return "Time Trigger Setting"
        }
        return nil
    }
}

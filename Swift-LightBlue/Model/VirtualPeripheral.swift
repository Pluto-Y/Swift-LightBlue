//
//  VirtualPeripheral.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2018/12/27.
//  Copyright © 2018 Pluto-y. All rights reserved.
//

import CoreBluetooth

struct VirtualPeripheral: Codable {
    
    struct Service: Codable {
        
        struct Characteristic: Codable {
            
            struct Properties: OptionSet, Codable {
                let rawValue: Int
                
                static let broadcast                    = Properties(rawValue: 1 << 0)
                static let read                         = Properties(rawValue: 1 << 1)
                static let writeWithoutResponse         = Properties(rawValue: 1 << 2)
                static let write                        = Properties(rawValue: 1 << 3)
                static let notify                       = Properties(rawValue: 1 << 4)
                static let indicate                     = Properties(rawValue: 1 << 5)
                static let authenticatedSignedWrites    = Properties(rawValue: 1 << 6)
                static let extendedProperties           = Properties(rawValue: 1 << 7)
                static let notifyEncryptionRequired     = Properties(rawValue: 1 << 8)
                static let indicateEncryptionRequired   = Properties(rawValue: 1 << 9)
                
                var cbProperties: CBCharacteristicProperties {
                    var result: CBCharacteristicProperties = []
                    if contains(.broadcast) {
                        result.formUnion(.broadcast)
                    }
                    if contains(.read) {
                        result.formUnion(.read)
                    }
                    if contains(.writeWithoutResponse) {
                        result.formUnion(.writeWithoutResponse)
                    }
                    if contains(.write) {
                        result.formUnion(.write)
                    }
                    if contains(.notify) {
                        result.formUnion(.notify)
                    }
                    if contains(.indicate) {
                        result.formUnion(.indicate)
                    }
                    if contains(.authenticatedSignedWrites) {
                        result.formUnion(.authenticatedSignedWrites)
                    }
                    if contains(.extendedProperties) {
                        result.formUnion(.extendedProperties)
                    }
                    if contains(.notifyEncryptionRequired) {
                        result.formUnion(.notifyEncryptionRequired)
                    }
                    if contains(.indicateEncryptionRequired) {
                        result.formUnion(.indicateEncryptionRequired)
                    }
                    return result
                }
                var names: [String] {
                    return self.cbProperties.names
                }
            }
            
            var uuidString: String
            var properties: Properties
            var userDescription: String?
            var value: Data?
            var cbCharacteristic: CBCharacteristic {
                return CBMutableCharacteristic(type: CBUUID(string: self.uuidString), properties: self.properties.cbProperties, value: nil, permissions: [])
            }
            
            init(uuid: CBUUID, properties: Properties) {
                self.uuidString = uuid.uuidString
                self.properties = properties
            }
        }
        
        var uuidString: String
        let primary: Bool
        var characteristics: [Characteristic]
        var cbService: CBService {
            let result = CBMutableService(type: CBUUID(string: self.uuidString), primary: self.primary)
            result.characteristics = characteristics.map({ (c) -> CBCharacteristic in
                return c.cbCharacteristic
            })
            return result
        }
        
        init(uuid: CBUUID, primary: Bool, characteristics: [Characteristic]) {
            self.uuidString = uuid.uuidString
            self.primary = primary
            self.characteristics = characteristics
        }
    }
    
    var name: String
    var uuid: UUID
    var services: [Service]
    
    func cbservices() -> [CBMutableService] {
        return []
    }
    
    static let blankPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CBUUID(string: "2222"), properties: .read))
        return VirtualPeripheral(name: "Blank", uuid: UUID(), services: [Service(uuid: CBUUID(string: "1111"), primary: true, characteristics: characteristics)])
    }()
    
    static let alertNotificationPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CBUUID.supportedUnreadAlertCategoryUUID, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CBUUID.newAlertUUID, properties: .notify))
        characteristics.append(Service.Characteristic(uuid: CBUUID.alertNotificationControlPointUUID, properties: .write))
        characteristics.append(Service.Characteristic(uuid: CBUUID.supportedNewAlertCategoryUUID, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CBUUID.unreadAlertStatusUUID, properties: .notify))
        let services: [Service] = [
            Service(uuid: CBUUID.alertNotificationUUID, primary: true, characteristics: characteristics)
        ]
        return VirtualPeripheral(name: "Alert Notification", uuid: UUID(), services: services)
    }()
    
    static let bloodPressurePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.intermediateCuffPressureUUID, properties: .notify))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.bloodPressureMeasurementUUID, properties: .indicate))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.bloodPressureFeatureUUID, properties: .read))
        let services: [Service] = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.bloodPressureUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Blood Pressure", uuid: UUID(), services: services)
    }()
    
    static let cyclingPowerPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CBUUID.cyclingPowerFeatureUUID, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CBUUID.cyclingPowerMeasurementUUID, properties: .notify))
        characteristics.append(Service.Characteristic(uuid: CBUUID.sensorLocationUUID, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CBUUID.cyclingPowerControlPointUUID, properties: [.write, .indicate]))
        characteristics.append(Service.Characteristic(uuid: CBUUID.cyclingPowerVectorUUID, properties: .notify))
        let services: [Service] = [
            Service(uuid: CBUUID.cyclingPowerUUID, primary: true, characteristics: characteristics),
        ]
        return VirtualPeripheral(name: "Cycling Power", uuid: UUID(), services: services)
    }()
    
    static let cyclingSpeedAndCadencePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.CSCFeatureUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.sensorLocationUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.CSCMeasurementUUID, properties: .notify))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.SCControlPointUUID, properties: [.write, .indicate]))
        let services = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.cyclingSpeedAndCadenceUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Cycling Speed and Cadence", uuid: UUID(), services: services)
    }()
    
    static let findMePeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CBUUID.alertLevelUUID, properties: []))
        let services = [
            Service(uuid: CBUUID.immediateAlertUUID, primary: true, characteristics: characteristics),
        ]
        return VirtualPeripheral(name: "Find Me", uuid: UUID(), services: services)
    }()
    
    static let glucosePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.glucoseMeasurementContextUUID, properties: .notify))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.glucoseFeatureUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.glucoseMeasurementUUID, properties: .notify))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.recordAccessControlPointUUID, properties: [.write, .indicate]))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        let services = [
            Service(uuid: CBUUID.glucoseUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Glucose", uuid: UUID(), services: services)
    }()
    
    static let HIDOVERGATTPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.reportUUID, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.HIDInformationUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.bootKeyboardInputReportUUID, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.bootKeyboardOutputReportUUID, properties: [.read, .write]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.reportMapUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.protocolModeUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.bootMouseInputReportUUID, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.HIDControlPointUUID, properties: []))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(uuid: CBUUID.batteryLevelUUID, properties: .read))
        var characteristics4: [Service.Characteristic] = []
        characteristics4.append(Service.Characteristic(uuid: CBUUID.scanIntervalWindowUUID, properties: []))
        characteristics4.append(Service.Characteristic(uuid: CBUUID.scanRefreshUUID, properties: .notify))
        let services = [
            Service(uuid: CBUUID.humanInterfaceDeviceUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics2),
            Service(uuid: CBUUID.batterServiceUUID, primary: true, characteristics: characteristics3),
            Service(uuid: CBUUID.scanParametersUUID, primary: true, characteristics: characteristics4),
        ]
        return VirtualPeripheral(name: "HID OVER GATT", uuid: UUID(), services: services)
    }()
    
    static let healthThermometerPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.intermediateTemperatureUUID, properties: .notify))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.temperatureMeasurementUUID, properties: .indicate))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.temperatureTypeUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.measurementIntervalUUID, properties: .read))
        let services = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.healthThermometerUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Health Thermometer", uuid: UUID(), services: services)
    }()
    
    static let heartRatePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.heartRateControlPointUUID, properties: .write))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.bodySensorLocationUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.heartRateMeasurementUUID, properties: .notify))
        let services = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.heartRateUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Heart Rate", uuid: UUID(), services: services)
    }()
    
    static let locationAndNavigationPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.LNFeatureUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.navigationUUID, properties: .notify))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.LNControlPointUUID, properties: [.write, .indicate]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.positionQualityUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.locationAndSpeedUUID, properties: .notify))
        let services = [
            Service(uuid: CBUUID.locationAndNavigationUUID, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Location and Navigation", uuid: UUID(), services: services)
    }()
    
    static let phoneAlertStatusPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.ringerSettingUUID, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.ringerControlPointUUID, properties: []))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.alertStatusUUID, properties: [.read, .notify]))
        let services = [
            Service(uuid: CBUUID.phoneAlertStatusServiceUUID, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Phone Alert Status", uuid: UUID(), services: services)
    }()
    
    static let polarHRSensorPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.batteryLevelUUID, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(uuid: CBUUID.bodySensorLocationUUID, properties: .read))
        characteristics3.append(Service.Characteristic(uuid: CBUUID.heartRateMeasurementUUID, properties: .notify))
        var characteristics4: [Service.Characteristic] = []
        characteristics4.append(Service.Characteristic(uuid: CBUUID(string: "6217FF4A-B07D-5DEB-261E-2586752D942E"), properties: [.read, .write]))
        let services = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.batterServiceUUID, primary: true, characteristics: characteristics2),
            Service(uuid: CBUUID.heartRateUUID, primary: true, characteristics: characteristics3),
            Service(uuid: CBUUID(string: "6217FF49-AC7B-547E-EECF-016A06970BA9"), primary: true, characteristics: characteristics4),
        ]
        return VirtualPeripheral(name: "Polar HR Sensor", uuid: UUID(), services: services)
    }()
    
    static let proximityPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.alertLevelUUID, properties: [.read, .write]))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.txPowerLevelUUID, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(uuid: CBUUID.alertLevelUUID, properties: []))
        let services = [
            Service(uuid: CBUUID.linkLossUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.txPowerUUID, primary: true, characteristics: characteristics2),
            Service(uuid: CBUUID.immediateAlertUUID, primary: true, characteristics: characteristics3),
        ]
        return VirtualPeripheral(name: "Proximity", uuid: UUID(), services: services)
    }()
    
    static let runningSpeedAndCadencePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.hardwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.modelNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.PnPIDUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.softwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.serialNumberStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.manufacturerNameStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.firmwareRevisionStringUUID, properties: .read))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.systemIDUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.RSCMeasurementUUID, properties: .notify))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.sensorLocationUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.RSCFeatureUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.SCControlPointUUID, properties: [.write, .indicate]))
        let services = [
            Service(uuid: CBUUID.deviceInformationUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.runningSpeedAndCadenceUUID, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Polar HR Sensor", uuid: UUID(), services: services)
    }()
    
    static let scanParametersPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.scanIntervalWindowUUID, properties: []))
        characteristics1.append(Service.Characteristic(uuid: CBUUID.scanRefreshUUID, properties: .notify))
        let services = [
            Service(uuid: CBUUID.scanParametersUUID, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Scan Parameters", uuid: UUID(), services: services)
    }()
    
    static let temperatureAlarmServicePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "CCCCFFFF-DEAD-F154-1319-740381000000"), properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "AAAAAAAA-DEAD-F154-1319-740381000000"), properties: .notify))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "EDEDEDED-DEAD-F154-1319-740381000000"), properties: [.read, .write]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "C0C0C0C0-DEAD-F154-1319-740381000000"), properties: [.read, .write]))
        let services = [
            Service(uuid: CBUUID(string: "DEADF154-0000-0000-0000-0000DEADF154"), primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Temperature Alarm Service", uuid: UUID(), services: services)
    }()
    
    static let timePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID.timeWithDSTUUID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(uuid: CBUUID.referenceTimeInformationUUID, properties: .read))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.currentTimeUUID, properties: [.read, .notify]))
        characteristics2.append(Service.Characteristic(uuid: CBUUID.localTimeInformationUUID, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(uuid: CBUUID.timeUpdateStateUUID, properties: .read))
        characteristics3.append(Service.Characteristic(uuid: CBUUID.timeUpdateControlPointUUID, properties: []))
        let services = [
            Service(uuid: CBUUID.nextDSTChangeServiceUUID, primary: true, characteristics: characteristics1),
            Service(uuid: CBUUID.currentTimeServiceUUID, primary: true, characteristics: characteristics2),
            Service(uuid: CBUUID.referenceTimeUpdateServiceUUID, primary: true, characteristics: characteristics3),
        ]
        return VirtualPeripheral(name: "Time", uuid: UUID(), services: services)
    }()
}

extension VirtualPeripheral: Equatable {
    static func == (lhs: VirtualPeripheral, rhs: VirtualPeripheral) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

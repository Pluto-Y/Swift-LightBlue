//
//  VirtualPeripheralStore.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2018/12/27.
//  Copyright © 2018 Pluto-y. All rights reserved.
//

import Foundation

class VirtualPeripheralStore: NSObject {
    
    static let shared = VirtualPeripheralStore()
    private let virtualPeripheralsKey = "virtualPeripheralUserDefaultKey"
    
    var cachedVirtualPeripheral: [VirtualPeripheral]
    
    override init() {
        if let data = UserDefaults.standard.object(forKey: virtualPeripheralsKey) as? Data, let array = try? JSONDecoder().decode(Array<VirtualPeripheral>.self, from: data) {
            cachedVirtualPeripheral = array
        } else {
            cachedVirtualPeripheral = []
        }
    }
    
    func add(virtualPeripheral: VirtualPeripheral) {
        cachedVirtualPeripheral.append(virtualPeripheral)
        syncVirtualPeriperals()
    }
    
    func remove(virtualPeripheral: VirtualPeripheral) {
        guard let index = cachedVirtualPeripheral.firstIndex(of: virtualPeripheral) else {
            return
        }
        cachedVirtualPeripheral.remove(at: index)
        syncVirtualPeriperals()
    }
    
    func insert(_ virtualPeripheral: VirtualPeripheral, at index: Int) {
        cachedVirtualPeripheral.insert(virtualPeripheral, at: index)
        syncVirtualPeriperals()
    }
    
    func remove(at index: Int) {
        cachedVirtualPeripheral.remove(at: index)
        syncVirtualPeriperals()
    }
    
    private func syncVirtualPeriperals() {
        guard let encodedData = try? JSONEncoder().encode(cachedVirtualPeripheral) else {
            return
        }
        UserDefaults.standard.set(encodedData, forKey: virtualPeripheralsKey)
        UserDefaults.standard.synchronize()
    }
}

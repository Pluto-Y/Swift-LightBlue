//
//  PreferencesStore.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/6.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import Foundation

class PreferencesStore : NSObject {
    
    static let shared = PreferencesStore()
    private let preferencesKey = "preferencesKey"
    
    var preferences: Preferences? {
        didSet {
            self.save()
        }
    }
    
    override init() {
        if let data = UserDefaults.standard.object(forKey: preferencesKey) as? Data, let preferences = try? JSONDecoder().decode(Preferences.self, from: data) {
            self.preferences = preferences
        }
    }
    
    private func save() {
        guard let encodedData = try? JSONEncoder().encode(preferences) else {
            return
        }
        
        UserDefaults.standard.set(encodedData, forKey: preferencesKey)
        UserDefaults.standard.synchronize()
    }
}

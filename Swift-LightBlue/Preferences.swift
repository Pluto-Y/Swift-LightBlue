//
//  Preferences.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/6.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import Foundation

struct Preferences: Codable {
    var needFilter: Bool
    var filter: Int
    
    init() {
        self.needFilter = false
        filter = -90
    }
}

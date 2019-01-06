//
//  LogStore.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/4.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import Foundation

class LogStore {
    
    static private var logs = [String]()
    
    class func append(_ log: String) {
        logs.append(log)
    }
    
    class func getAllLogs() -> [String] {
        return logs
    }
}

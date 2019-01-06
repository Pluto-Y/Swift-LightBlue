//
//  String+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/4.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import Foundation

extension String {
    
    /// Create NSData from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a NSData object. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too. This does no validation of the string to ensure it's a valid hexadecimal string
    ///
    /// The use of `strtoul` inspired by Martin R at http://stackoverflow.com/a/26284562/1271826
    ///
    /// - returns: NSData represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range.
    
    func dataFromHexadecimalString() -> Data? {
        let trimmedString = self.trimmingCharacters(in: CharacterSet(charactersIn: "<> ")).replacingOccurrences(of: " ", with: "")
        
        // make sure the cleaned up string consists solely of hex digits, and that we have even number of them
        
        let regex = try! NSRegularExpression(pattern: "^[0-9a-f]*$", options: .caseInsensitive)
        
        let found = regex.firstMatch(in: trimmedString, options: [], range: NSMakeRange(0, trimmedString.count))
        if found == nil || found?.range.location == NSNotFound || trimmedString.count % 2 != 0 {
            return nil
        }
        
        // everything ok, so now let's build NSData
        
        let data = NSMutableData(capacity: trimmedString.count / 2)
        
        var index = trimmedString.startIndex
        while index < trimmedString.endIndex {
            let byteString = String(trimmedString[index ..< trimmedString.index(after: trimmedString.index(after: index))])
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data?.append([num] as [UInt8], length: 1)
            index = trimmedString.index(after: trimmedString.index(after: index))
        }
        
        //        for var index = trimmedString.startIndex; index < trimmedString.endIndex; index = trimmedString.index(after: trimmedString.index(after: index)) {
        //            let byteString = trimmedString.substring(with: (index ..< trimmedString.index(after: trimmedString.index(after: index))))
        //            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
        //            data?.append([num] as [UInt8], length: 1)
        //        }
        
        return data as Data?
    }
}

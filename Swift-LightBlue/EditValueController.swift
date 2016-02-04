//
//  EditValueController.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/2/3.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth

class EditValueController: UIViewController, BluetoothDelegate {
    
    let bluetoothManager = BluetoothManager.getInstance()
    var characteristic: CBCharacteristic?
    var writeType: CBCharacteristicWriteType?

    @IBOutlet var valueInputTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    func initAll() {
        assert(characteristic != nil || writeType != nil, "The EditValueController didn't initilize correct!")
        self.title = "Edit Value"
        bluetoothManager.delegate = self
        let inputView = MRHexKeyboard(textField: valueInputTf)
        inputView.setDoneAction { () -> Void in
            if let textContent = self.valueInputTf.text {
                if textContent == "" {
                    return
                }
                var hexString = textContent.substringFromIndex(textContent.startIndex.advancedBy(2))
                if hexString.characters.count % 2 != 0 {
                    hexString = "0" + hexString
                }
                let data = hexString.dataFromHexadecimalString()
                self.bluetoothManager.writeValue(data!, forCahracteristic: self.characteristic!, type: self.writeType!)
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
        valueInputTf.inputView = inputView
    }


}

extension String {
    
    /// Create NSData from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a NSData object. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too. This does no validation of the string to ensure it's a valid hexadecimal string
    ///
    /// The use of `strtoul` inspired by Martin R at http://stackoverflow.com/a/26284562/1271826
    ///
    /// - returns: NSData represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range.
    
    func dataFromHexadecimalString() -> NSData? {
        let trimmedString = self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<> ")).stringByReplacingOccurrencesOfString(" ", withString: "")
        
        // make sure the cleaned up string consists solely of hex digits, and that we have even number of them
        
        let regex = try! NSRegularExpression(pattern: "^[0-9a-f]*$", options: .CaseInsensitive)
        
        let found = regex.firstMatchInString(trimmedString, options: [], range: NSMakeRange(0, trimmedString.characters.count))
        if found == nil || found?.range.location == NSNotFound || trimmedString.characters.count % 2 != 0 {
            return nil
        }
        
        // everything ok, so now let's build NSData
        
        let data = NSMutableData(capacity: trimmedString.characters.count / 2)
        
        for var index = trimmedString.startIndex; index < trimmedString.endIndex; index = index.successor().successor() {
            let byteString = trimmedString.substringWithRange(Range<String.Index>(start: index, end: index.successor().successor()))
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data?.appendBytes([num] as [UInt8], length: 1)
        }
        
        return data
    }
}

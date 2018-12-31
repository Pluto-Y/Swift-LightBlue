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
        inputView?.setDoneAction { () -> Void in
            guard let textContent = self.valueInputTf.text, textContent != "" else {
                return
            }
            var hexString = String(textContent[textContent.index(textContent.startIndex, offsetBy: 2)...])
            if hexString.count % 2 != 0 {
                hexString = "0" + hexString
            }
            let data = hexString.dataFromHexadecimalString()
            self.bluetoothManager.writeValue(data: data!, forCharacteristic: self.characteristic!, type: self.writeType!)
            self.navigationController?.popViewController(animated: true)
        }
        valueInputTf.inputView = inputView
    }


}

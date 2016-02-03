//
//  EditValueController.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/2/3.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class EditValueController: UIViewController {

    @IBOutlet var valueInputTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    func initAll() {
        self.title = "Edit Value"
        let inputView = MRHexKeyboard(textField: valueInputTf)
        inputView.setDoneAction { () -> Void in
            self.navigationController?.popViewControllerAnimated(true)
        }
        valueInputTf.inputView = inputView
    }


}

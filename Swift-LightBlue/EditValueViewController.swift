//
//  EditValueViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/7.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class EditValueViewController: UIViewController, UITextFieldDelegate {
    
    public enum ValueType {
        case hex, string
    }
    
    public var callback: ((String) -> Void)?
    public var contentTitle: String = "Value"
    public var defaultValue: Any = ""
    public var valueType: ValueType = .string
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }

    private func initAll() {
        self.title = "EditValue"
        self.toolbarItems = self.navigationController?.toolbar.items
        self.contentTitleLabel.text = self.contentTitle
        self.valueTextField.text = String(describing: defaultValue)
        if valueType == .hex {
            let inputView = MRHexKeyboard(textField: valueTextField)
            inputView?.setDoneAction { () -> Void in
                guard let textContent = self.valueTextField.text, textContent != "" else {
                    return
                }
                
                if let callback = self.callback {
                    callback(textContent)
                }
                self.navigationController?.popViewController(animated: true)
            }
            valueTextField.inputView = inputView
        } else {
            self.valueTextField.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        if let callback = self.callback {
            callback(text)
        }
        self.navigationController?.popViewController(animated: true)
        return true
    }

}

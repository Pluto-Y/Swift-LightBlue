//
//  VirtualPeripheralViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/2.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class VirtualPeripheralViewController: UIViewController {
    
    var virtualPeripheral: VirtualPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }

    private func initAll() {
        self.title = "Virtual Peripheral"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Option", style: .plain, target: self, action: #selector(didOptionClick(_:)))
    }
    
    @objc private func didOptionClick(_ sender: AnyObject) {
        print("didOptionClick")
    }
    
}

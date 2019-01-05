//
//  RootController.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/3.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class RootController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.setToolbarHidden(false, animated: false)
        
        let infoBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(didInfoClick(_:)))
        let flexbleSpaceBarButtomItem1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let aboutBarButtomItem = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(didAboutClick(_:)))
        let flexbleSpaceBarButtomItem2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let logBarButtomItem = UIBarButtonItem(title: "Log", style: .plain, target: self, action: #selector(didLogClick(_:)))
        let toolbarItems = [infoBarButtonItem, flexbleSpaceBarButtomItem1, aboutBarButtomItem, flexbleSpaceBarButtomItem2, logBarButtomItem]
        self.toolbar.setItems(toolbarItems, animated: false)
    }
    
    private func initAll() {
        self.navigationBar.isTranslucent = false
        self.view.backgroundColor = .white
        self.setToolbarHidden(false, animated: false)
    }
    
    @objc private func didInfoClick(_ sender: Any) {
        present(UINavigationController(rootViewController: InfoViewController()), animated: true, completion: nil)
    }

    @objc private func didAboutClick(_ sneder: Any) {
        present(AboutMeViewController(), animated: true, completion: nil)
    }

    @objc private func didLogClick(_ sender: Any) {
        present(UINavigationController(rootViewController: LogViewController()), animated: true, completion: nil)
    }
    
}

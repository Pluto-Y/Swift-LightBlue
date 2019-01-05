//
//  LogViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/4.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class LogViewController : UIViewController {
    
    @IBOutlet weak var logLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    private func initAll() {
        self.title = "Log"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(didCloseClick(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didShareClick(_:)))
        
        logLabel.text = LogStore.getAllLogs().joined(separator: "\n")
    }
    
    /**
     Back to preview controller
     */
    @objc private func didCloseClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didShareClick(_ sender: Any) {
        print("didShareClick")
    }
}

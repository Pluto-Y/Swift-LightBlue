//
//  AlertUtil.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/12.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class AlertUtil: NSObject {
    static func showCancelAlert(_ title: String, message: String, cancelTitle: String, viewController: UIViewController) {
        // The system version is less than 9.0
        if UIDevice.current.systemVersion.compare("9.0.0", options: NSString.CompareOptions.numeric) == .orderedAscending {
            UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: cancelTitle).show()
        } else { // The system version is greate than or equal 9.0
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}

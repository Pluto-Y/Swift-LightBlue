//
//  AlertUtil.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/12.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class AlertUtil: NSObject {
    static func showCancelAlert(title: String, message: String, cancelTitle: String, viewController: UIViewController) {
        // The system version is less than 9.0
        if UIDevice.currentDevice().systemVersion.compare("9.0.0", options: NSStringCompareOptions.NumericSearch) == .OrderedAscending {
            UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: cancelTitle).show()
        } else { // The system version is greate than or equal 9.0
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: cancelTitle, style: .Cancel, handler: nil))
            viewController.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}
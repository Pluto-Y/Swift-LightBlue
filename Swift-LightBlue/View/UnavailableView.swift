//
//  UnavailableView.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/6.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit


class UnavailableView : UIView {
    
    struct Static {
        static var unavailableView = UnavailableView()
    }
    
    init() {
        super.init(frame:UIScreen.mainScreen().bounds)
        self.initAll()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Init the view components
     */
    func initAll() {
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        // Create the top ImageView
        let imgView = UIImageView(image: UIImage(named: "bluetooth_unavailable"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgView)
        
        /// Create and add the constraints for the ImageView
        let imgCenterX = imgView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let imgCenterY = imgView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor, constant: -60)
        let imgWidth = imgView.widthAnchor.constraintEqualToConstant(160)
        let imgHeight = imgView.heightAnchor.constraintEqualToAnchor(imgView.widthAnchor, multiplier: 1.0)
        NSLayoutConstraint.activateConstraints([imgCenterX, imgCenterY, imgWidth, imgHeight])
        
        /// Create the title tips Label
        let tip1Lbl = UILabel()
        tip1Lbl.translatesAutoresizingMaskIntoConstraints = false
        tip1Lbl.text = "LightBlue requires Bluetooth"
        tip1Lbl.font = UIFont.systemFontOfSize(18, weight: UIFontWeightThin)
        tip1Lbl.textColor = UIColor.blackColor()
        self.addSubview(tip1Lbl)
        
        /// Create and add the constraints for the title tips
        let lblTop = tip1Lbl.topAnchor.constraintEqualToAnchor(imgView.bottomAnchor, constant: 10)
        let lblCenterX = tip1Lbl.centerXAnchor.constraintEqualToAnchor(imgView.centerXAnchor)
        let lblWidth = tip1Lbl.widthAnchor.constraintGreaterThanOrEqualToConstant(20)
        NSLayoutConstraint.activateConstraints([lblTop, lblCenterX, lblWidth])
        
        /// Create the detail tips Label
        let tip2Lbl = UILabel()
        tip2Lbl.translatesAutoresizingMaskIntoConstraints = false
        tip2Lbl.text = "Please enable Bluetooth to continue using this app"
        tip2Lbl.font = UIFont.systemFontOfSize(12, weight: UIFontWeightLight)
        tip2Lbl.textColor = UIColor.blackColor()
        self.addSubview(tip2Lbl)
        
        /// Create and add constraints for the detail tips
        let lbl2Top = tip2Lbl.topAnchor.constraintEqualToAnchor(tip1Lbl.bottomAnchor, constant: 10)
        let lbl2CenterX = tip2Lbl.centerXAnchor.constraintEqualToAnchor(tip1Lbl.centerXAnchor)
        let lbl2Width = tip2Lbl.widthAnchor.constraintGreaterThanOrEqualToConstant(20)
        NSLayoutConstraint.activateConstraints([lbl2Top, lbl2CenterX, lbl2Width])
    }
    
    /**
     Show the UnavailableView
     */
    static func showUnavailableView() {
        if let window = UIApplication.sharedApplication().keyWindow {
            window.addSubview(Static.unavailableView)
        }
    }
    
    /**
     Hide the UnavailableView
     */
    static func hideUnavailableView() {
        Static.unavailableView.removeFromSuperview()
    }
}

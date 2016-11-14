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
        super.init(frame:UIScreen.main.bounds)
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
        let imgCenterX = imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let imgCenterY = imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60)
        let imgWidth = imgView.widthAnchor.constraint(equalToConstant: 160)
        let imgHeight = imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 1.0)
        NSLayoutConstraint.activate([imgCenterX, imgCenterY, imgWidth, imgHeight])
        
        /// Create the title tips Label
        let tip1Lbl = UILabel()
        tip1Lbl.translatesAutoresizingMaskIntoConstraints = false
        tip1Lbl.text = "LightBlue requires Bluetooth"
        tip1Lbl.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
        tip1Lbl.textColor = UIColor.black
        self.addSubview(tip1Lbl)
        
        /// Create and add the constraints for the title tips
        let lblTop = tip1Lbl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10)
        let lblCenterX = tip1Lbl.centerXAnchor.constraint(equalTo: imgView.centerXAnchor)
        let lblWidth = tip1Lbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)
        NSLayoutConstraint.activate([lblTop, lblCenterX, lblWidth])
        
        /// Create the detail tips Label
        let tip2Lbl = UILabel()
        tip2Lbl.translatesAutoresizingMaskIntoConstraints = false
        tip2Lbl.text = "Please enable Bluetooth to continue using this app"
        tip2Lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightLight)
        tip2Lbl.textColor = UIColor.black
        self.addSubview(tip2Lbl)
        
        /// Create and add constraints for the detail tips
        let lbl2Top = tip2Lbl.topAnchor.constraint(equalTo: tip1Lbl.bottomAnchor, constant: 10)
        let lbl2CenterX = tip2Lbl.centerXAnchor.constraint(equalTo: tip1Lbl.centerXAnchor)
        let lbl2Width = tip2Lbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)
        NSLayoutConstraint.activate([lbl2Top, lbl2CenterX, lbl2Width])
    }
    
    /**
     Show the UnavailableView
     */
    static func showUnavailableView() {
        if let window = UIApplication.shared.keyWindow {
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

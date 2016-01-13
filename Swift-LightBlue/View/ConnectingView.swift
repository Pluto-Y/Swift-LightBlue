//
//  ConnectingView.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/7.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class ConnectingView: UIView {
    
    struct Static {
        static var connectingView = ConnectingView()
    }
    let tipLbl = UILabel()
    let tipNameLbl = UILabel()
    
    private init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.initAll()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAll() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.whiteColor()
        
        
        tipLbl.translatesAutoresizingMaskIntoConstraints = false
        tipLbl.text = "Connecting..."
        tipLbl.font = UIFont.systemFontOfSize(18)
        contentView.addSubview(tipLbl)
        
        tipNameLbl.translatesAutoresizingMaskIntoConstraints = false
        tipNameLbl.text = "Pluto Y-BLE"
        tipNameLbl.font = UIFont.systemFontOfSize(16)
        contentView.addSubview(tipNameLbl)
        
        let activityIndicatorView =  UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.activityIndicatorViewStyle = .Gray
        activityIndicatorView.startAnimating()
        contentView.addSubview(activityIndicatorView)
        
        self.addSubview(contentView)
        
        let contentViewLeading = contentView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 50)
        let contentViewTrailing = contentView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -50)
        let contentViewHeight = contentView.heightAnchor.constraintEqualToConstant(120)
        let contentViewCenterY = contentView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor, constant: -90)
        NSLayoutConstraint.activateConstraints([contentViewLeading, contentViewTrailing, contentViewHeight, contentViewCenterY])
        
        let tipLblTop = tipLbl.topAnchor.constraintEqualToAnchor(contentView.topAnchor, constant: 20)
        let tipLblCenterX = tipLbl.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor)
        let tipLblWidth = tipLbl.widthAnchor.constraintGreaterThanOrEqualToConstant(20)
        NSLayoutConstraint.activateConstraints([tipLblTop, tipLblCenterX, tipLblWidth])
        
        let tipNameLblTop = tipNameLbl.topAnchor.constraintEqualToAnchor(tipLbl.bottomAnchor, constant: 10)
        let tipNameLblCenterX = tipNameLbl.centerXAnchor.constraintEqualToAnchor(tipLbl.centerXAnchor)
        let tipNameLblWidth = tipNameLbl.widthAnchor.constraintGreaterThanOrEqualToConstant(20)
        NSLayoutConstraint.activateConstraints([tipNameLblTop, tipNameLblCenterX, tipNameLblWidth])
        
        let activityViewTop = activityIndicatorView.topAnchor.constraintEqualToAnchor(tipNameLbl.bottomAnchor, constant: 10)
        let activityViewCenterX = activityIndicatorView.centerXAnchor.constraintEqualToAnchor(tipNameLbl.centerXAnchor)
        let activityViewWidth = activityIndicatorView.widthAnchor.constraintEqualToConstant(10)
        NSLayoutConstraint.activateConstraints([activityViewTop, activityViewWidth, activityViewCenterX])
    }
    
    /**
     Show the ConnectingView
     */
    static func showConnectingView() -> ConnectingView {
        if let window = UIApplication.sharedApplication().keyWindow {
            window.addSubview(Static.connectingView)
        }
        return Static.connectingView
    }
    
    /**
     Hide the ConnectingView
     */
    static func hideConnectingView() {
        Static.connectingView.removeFromSuperview()
    }

}

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
    
    fileprivate init() {
        super.init(frame: UIScreen.main.bounds)
        self.initAll()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAll() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.white
        
        
        tipLbl.translatesAutoresizingMaskIntoConstraints = false
        tipLbl.text = "Connecting..."
        tipLbl.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(tipLbl)
        
        tipNameLbl.translatesAutoresizingMaskIntoConstraints = false
        tipNameLbl.text = "Pluto Y-BLE"
        tipNameLbl.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(tipNameLbl)
        
        let activityIndicatorView =  UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.style = .gray
        activityIndicatorView.startAnimating()
        contentView.addSubview(activityIndicatorView)
        
        self.addSubview(contentView)
        
        let contentViewLeading = contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50)
        let contentViewTrailing = contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        let contentViewHeight = contentView.heightAnchor.constraint(equalToConstant: 120)
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -90)
        NSLayoutConstraint.activate([contentViewLeading, contentViewTrailing, contentViewHeight, contentViewCenterY])
        
        let tipLblTop = tipLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        let tipLblCenterX = tipLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let tipLblWidth = tipLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)
        NSLayoutConstraint.activate([tipLblTop, tipLblCenterX, tipLblWidth])
        
        let tipNameLblTop = tipNameLbl.topAnchor.constraint(equalTo: tipLbl.bottomAnchor, constant: 10)
        let tipNameLblCenterX = tipNameLbl.centerXAnchor.constraint(equalTo: tipLbl.centerXAnchor)
        let tipNameLblWidth = tipNameLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)
        NSLayoutConstraint.activate([tipNameLblTop, tipNameLblCenterX, tipNameLblWidth])
        
        let activityViewTop = activityIndicatorView.topAnchor.constraint(equalTo: tipNameLbl.bottomAnchor, constant: 10)
        let activityViewCenterX = activityIndicatorView.centerXAnchor.constraint(equalTo: tipNameLbl.centerXAnchor)
        let activityViewWidth = activityIndicatorView.widthAnchor.constraint(equalToConstant: 10)
        NSLayoutConstraint.activate([activityViewTop, activityViewWidth, activityViewCenterX])
    }
    
    /**
     Show the ConnectingView
     */
    static func showConnectingView() -> ConnectingView {
        if let window = UIApplication.shared.keyWindow {
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

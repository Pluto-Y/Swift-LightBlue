//
//  Characteristic2BtnsCell.swift
//  Swift-LightBlue
//
//  Created by ChipSea on 16/2/2.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit



public class Characteristic2BtnsCell: UITableViewCell {
    
    
    @IBOutlet var leftBtn: UIButton!
    @IBOutlet var rightBtn: UIButton!
    
    private var leftAction: (() -> ())?
    private var rightAction: (() -> ())?
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        leftBtn.addTarget(self, action: #selector(self.leftBtnClick(_:)), forControlEvents: .TouchUpInside)
        rightBtn.addTarget(self, action: #selector(self.rightBtnClick(_:)), forControlEvents: .TouchUpInside)
    }
    
    public func enableBtns() {
        leftBtn.enabled = true
        rightBtn.enabled = true
    }
    
    public func disableBtns() {
        leftBtn.enabled = false
        rightBtn.enabled = false
    }
    
    public func setLeftAction(action: (() -> ())) {
        self.leftAction = action
    }
    
    public func setRightAction(action: () -> ()) {
        self.rightAction = action
    }
    
    func leftBtnClick(sender: AnyObject?) {
        if let action = leftAction {
            action()
        }
    }
    
    func rightBtnClick(sender: AnyObject?) {
        if let action = rightAction {
            action()
        }
    }
    
}

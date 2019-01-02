//
//  VirtualPeripheralCell.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/4.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import UIKit

class VirtualPeripheralCell : UITableViewCell {
    
    @IBOutlet weak var checkIconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    private var didCheckImgClickAction: (() -> Void)?
    
    override func awakeFromNib() {
        checkIconImageView.isUserInteractionEnabled = true
        let tapRecognizeGesture = UITapGestureRecognizer(target: self, action: #selector(didCheckImgClick(_:)))
        checkIconImageView.addGestureRecognizer(tapRecognizeGesture)
    }
    
    func setDidCheckImgClickAction(_ action: @escaping (() -> Void)) {
        didCheckImgClickAction = action
    }
    
    @objc private func didCheckImgClick(_ sender: AnyObject) {
        guard let action = didCheckImgClickAction else {
            return
        }
        
        action()
    }
    
}

//
//  FilterViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/4.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class FilterViewController : UIViewController {
    
    @IBOutlet var needFilterLayoutConstraints: [NSLayoutConstraint]!
    @IBOutlet var notNeedFilterLayoutConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var needFilterSwitch: UISwitch!
    @IBOutlet weak var filterValueSlider: UISlider!
    @IBOutlet weak var minimumRSSILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if needFilterSwitch.isOn {
            NSLayoutConstraint.deactivate(self.notNeedFilterLayoutConstraints)
            NSLayoutConstraint.activate(self.needFilterLayoutConstraints)
        } else {
            NSLayoutConstraint.deactivate(self.needFilterLayoutConstraints)
            NSLayoutConstraint.activate(self.notNeedFilterLayoutConstraints)
        }
    }
    
    private func initAll() {
        if let needFilter = PreferencesStore.shared.preferences?.needFilter, needFilter {
            needFilterSwitch.isOn = true
            filterValueSlider.value = Float(PreferencesStore.shared.preferences!.filter)
        } else {
            needFilterSwitch.isOn = false
        }
        reloadViews()
    }
    
    private func reloadViews() {
        if needFilterSwitch.isOn {
            NSLayoutConstraint.deactivate(self.notNeedFilterLayoutConstraints)
            NSLayoutConstraint.activate(self.needFilterLayoutConstraints)
            
            guard let filterValue = PreferencesStore.shared.preferences?.filter else {
                return
            }
            
            let minimumValue = abs(Int(filterValue))
            var barValue = 0
            switch labs(minimumValue) {
            case 0...40:
                barValue = 5
            case 41...53:
                barValue = 4
            case 54...65:
                barValue = 3
            case 66...77:
                barValue = 2
            case 77...89:
                barValue = 1
            default:
                barValue = 0
            }
            minimumRSSILabel.text =  "Minimum RSSI: -\(minimumValue) dB (\(barValue) bar\(barValue <= 1 ? "" : "s"))"
        } else {
            NSLayoutConstraint.deactivate(self.needFilterLayoutConstraints)
            NSLayoutConstraint.activate(self.notNeedFilterLayoutConstraints)
        }
    }
    
    @IBAction func didSwitchToggle(_ sw: UISwitch) {
        if PreferencesStore.shared.preferences == nil {
            PreferencesStore.shared.preferences = Preferences()
        }
        PreferencesStore.shared.preferences?.needFilter = sw.isOn
        reloadViews()
    }
    
    @IBAction func didSliderChang(_ slider: UISlider) {
        PreferencesStore.shared.preferences?.filter = Int(slider.value)
        reloadViews()
    }
}

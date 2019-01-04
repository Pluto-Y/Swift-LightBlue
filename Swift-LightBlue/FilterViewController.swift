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
    
    var needFilter: Bool {
        get {
            return PreferencesStore.shared.preferences?.needFilter ?? false
        }
        set(newValue) {
            guard let _ = PreferencesStore.shared.preferences else {
                PreferencesStore.shared.preferences = Preferences()
                PreferencesStore.shared.preferences!.needFilter = newValue
                return
            }
            PreferencesStore.shared.preferences!.needFilter = newValue
        }
    }
    var filterValue: Int {
        get {
            return PreferencesStore.shared.preferences?.filter ?? -90
        }
        set(newValue) {
            guard let _ = PreferencesStore.shared.preferences else {
                PreferencesStore.shared.preferences = Preferences()
                PreferencesStore.shared.preferences!.needFilter = true
                PreferencesStore.shared.preferences!.filter = newValue
                return
            }
            PreferencesStore.shared.preferences!.filter = newValue
        }
    }
    
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
        self.toolbarItems = self.navigationController?.toolbar.items
        if needFilter {
            needFilterSwitch.isOn = true
            filterValueSlider.value = Float(filterValue)
        } else {
            needFilterSwitch.isOn = false
        }
        reloadViews()
    }
    
    private func reloadViews() {
        if needFilterSwitch.isOn {
            NSLayoutConstraint.deactivate(self.notNeedFilterLayoutConstraints)
            NSLayoutConstraint.activate(self.needFilterLayoutConstraints)
            
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
        needFilter = sw.isOn
        reloadViews()
    }
    
    @IBAction func didSliderChang(_ slider: UISlider) {
        filterValue = Int(slider.value)
        reloadViews()
    }
}

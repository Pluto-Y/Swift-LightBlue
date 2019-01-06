//
//  VirtualPeripheralViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/2.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit
import CoreBluetooth

class VirtualPeripheralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let kVirtualPeriperalCellReuseIdetifier = "kVirtualPeriperalCellReuseIdetifier"
    var virtualPeripheral: VirtualPeripheral!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }

    private func initAll() {
        self.title = "Virtual Peripheral"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Option", style: .plain, target: self, action: #selector(didOptionClick(_:)))
        self.toolbarItems = self.navigationController?.toolbar.items
        
        tableView.reloadData()
    }
    
    @objc private func didOptionClick(_ sender: AnyObject) {
    }
    
    // MARK: UITableViewDelegate & UITableViewDataSource
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 239/255.0, green: 238/255.0, blue: 243/255.0, alpha: 1.0)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(red: 84/255.0, green: 83/255.0, blue: 88/255.0, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 13)
        if section == 0 {
            titleLabel.text = "GENERAL"
        } else {
            let uuidString = virtualPeripheral.services[section - 1].uuidString
            titleLabel.text = CBUUID(string: uuidString).name ?? "UUID: \(uuidString)"
        }
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(origin: CGPoint(x: 15, y: (40.0 - titleLabel.frame.size.height) / 2.0), size: titleLabel.frame.size)
        headerView.addSubview(titleLabel)
        
        let screenSize = UIScreen.main.bounds.size
        let infoBtn = UIButton(type: .infoLight)
        infoBtn.tag = section - 1
        infoBtn.frame = CGRect(origin: CGPoint(x: screenSize.width - infoBtn.frame.size.width - 8, y: (40 - infoBtn.frame.size.height) / 2.0), size: infoBtn.frame.size)
        headerView.addSubview(infoBtn)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: kVirtualPeriperalCellReuseIdetifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: kVirtualPeriperalCellReuseIdetifier)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            
        }
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        guard indexPath.section != 0 else {
            if indexPath.row == 0 {
                cell.textLabel?.text = virtualPeripheral.uuid.uuidString
                cell.detailTextLabel?.text = "UUID"
            } else {
                cell.textLabel?.text = virtualPeripheral.name
                cell.detailTextLabel?.text = "Name"
            }
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            return cell
        }
        
        let charactristic = virtualPeripheral.services[indexPath.section - 1].characteristics[indexPath.row]
        cell.textLabel?.text = CBUUID(string: charactristic.uuidString).name ?? "0x\(charactristic.uuidString)"
        cell.detailTextLabel?.text = "Properties: \(charactristic.cbProperties.names.joined(separator: " "))"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return virtualPeripheral.services.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 0 else {
            return 2
        }
        return virtualPeripheral.services[section - 1].characteristics.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let charactristic = virtualPeripheral.services[indexPath.section - 1].characteristics[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            virtualPeripheral.services[indexPath.section - 1].characteristics.remove(at: indexPath.row)
            if virtualPeripheral.services[indexPath.section - 1].characteristics.count == 0 {
                virtualPeripheral.services.remove(at: indexPath.section - 1)
            }
            self.tableView.reloadData()
            
            if let index = VirtualPeripheralStore.shared.cachedVirtualPeripheral.firstIndex(of: self.virtualPeripheral) {
                VirtualPeripheralStore.shared.remove(at: index)
                VirtualPeripheralStore.shared.insert(self.virtualPeripheral, at: index)
            }
        }
    }
    
}

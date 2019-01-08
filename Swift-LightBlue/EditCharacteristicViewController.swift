//
//  EditCharacteristicViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/14.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class EditCharacteristicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let characteristicCellReuseIdentifier = "CharacteristicCell"
    public var characterist: VirtualPeripheral.Service.Characteristic!
    private let generalTitle = ["UUID", "Characteristic User Description", "Hex"]
    private var propertiesString: [String] {
        return characterist.cbCharacteristic.properties.names
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initAll()
    }

    func initAll() {
        self.title = characterist.cbCharacteristic.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hex", style: .plain, target: self, action: #selector(didHexClick(_:)))
        self.toolbarItems = self.navigationController?.toolbar.items
    }
    
    @objc private func didHexClick(_ sender: Any) {
        print("didHexClick")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 0 else {
            return 3
        }
        return propertiesString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section != 0  else {
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: characteristicCellReuseIdentifier)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: characteristicCellReuseIdentifier)
                cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .none
            }
            
            if indexPath.row == 0 {
                cell.textLabel?.text = characterist.uuidString
            } else if indexPath.row == 1 {
                cell.textLabel?.text = characterist.userDescription ?? "<unset>"
            } else if indexPath.row == 2 {
                if let data = self.characterist.value, let value = String(data: data, encoding: .utf8) {
                    cell.textLabel?.text = value
                } else {
                    cell.textLabel?.text = "No Value"
                }
            }
            cell.detailTextLabel?.text = generalTitle[indexPath.row]
            
            return cell
        }
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: characteristicCellReuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: characteristicCellReuseIdentifier)
            cell.accessoryType = .disclosureIndicator
        }
        
        cell.textLabel?.text = propertiesString[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 239/255.0, green: 238/255.0, blue: 243/255.0, alpha: 1.0)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(red: 84/255.0, green: 83/255.0, blue: 88/255.0, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 13)
        if section == 0 {
            titleLabel.text = "GENERAL"
        } else {
            titleLabel.text = "PROPERTY"
        }
        
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(origin: CGPoint(x: 15, y: (40.0 - titleLabel.frame.size.height) / 2.0), size: titleLabel.frame.size)
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editValueViewController = EditValueViewController()
        guard indexPath.section != 0 else {
            if indexPath.row == 0 {
                editValueViewController.callback = { [weak self] (string) in
                    guard let self = self else {
                        return
                    }
                    self.characterist.uuidString = string
                    self.title = self.characterist.cbCharacteristic.name
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                editValueViewController.valueType = .hex
                editValueViewController.defaultValue = characterist.uuidString
            } else if indexPath.row == 1 {
                editValueViewController.callback = { [weak self] (string) in
                    guard let self = self else {
                        return
                    }
                    self.characterist.userDescription = string
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                editValueViewController.valueType = .string
            } else if indexPath.row == 2 {
                editValueViewController.callback = { [weak self] (string) in
                    guard let self = self else {
                        return
                    }
                    self.characterist.value = string.data(using: .utf8)
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                editValueViewController.valueType = .hex
                editValueViewController.defaultValue = characterist.value ?? ""
            }
            
            editValueViewController.contentTitle = generalTitle[indexPath.row]
            navigationController?.pushViewController(editValueViewController, animated: true)
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            
        } else if indexPath.section == 1 {
            let viewController = EditCharacteristicPropertyTableViewController()
            viewController.selectedProperties = characterist.properties
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

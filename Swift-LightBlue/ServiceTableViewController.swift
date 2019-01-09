//
//  ServiceTableViewController.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2019/1/9.
//  Copyright © 2019 Pluto-y. All rights reserved.
//

import UIKit

class ServiceTableViewController: UITableViewController {
    
    private let serviceCellReuseIdentifier = "ServiceCell"
    public var services: [VirtualPeripheral.Service]!
    public var callback: ((VirtualPeripheral.Service) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
    }
    
    private func initAll() {
        self.toolbarItems = self.navigationController?.toolbar.items
    }

    // MARK: - UITableViewDelegate && UITableViewDataSouce
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: serviceCellReuseIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: serviceCellReuseIdentifier)
        }
        
        let service = services[indexPath.row]
        cell.textLabel?.text = service.cbService.name
        cell.detailTextLabel?.text = service.uuidString

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let callback = self.callback {
            callback(services[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }

}

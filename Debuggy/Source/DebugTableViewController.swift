//
//  DebugTableViewController.swift
//  DebugDemo
//
//  Created by Vince Davis on 8/26/19.
//  Copyright © 2019 Vince Davis. All rights reserved.
//

import UIKit

/// Top-level screen for the Debug menu
public class DebugTableViewController: UITableViewController {

    lazy var list: [(String, UIViewController)] = {
        return [
            (String.styleGuide, DebugUXStyleTableViewController()),
            (String.strings, StringTableViewController()),
            (String.debugViews,UIDebugBundleListViewController())
        ]
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()

        title = .hiddenDebug
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = list[indexPath.row]
        cell.textLabel?.text = item.0
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = list[indexPath.row]
        
        if indexPath.row == 2 {
            let debugList = DemoUIDebug.allCases as [UIDebuggable]
            let vc = UIDebugBundleListViewController(with: debugList)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.pushViewController(item.1, animated: true)
        }
    }
}

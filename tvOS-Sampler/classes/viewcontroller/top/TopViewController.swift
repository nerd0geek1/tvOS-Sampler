//
//  TopViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/23.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class TopViewController: UITableViewController {

    let items: [String] = ["Focus"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    //MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")!
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
}

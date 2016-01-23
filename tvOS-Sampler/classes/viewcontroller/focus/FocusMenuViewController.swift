//
//  FocusMenuViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/23.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class FocusMenuViewController: UITableViewController {

    let items: [[String : AnyObject]] = [
                                            [
                                                "Title" : "Focusable",
                                                "Desc"  : "Focus movement among Focusable objects"
                                            ],
                                            [
                                                "Title" : "Focusable and not Focusable",
                                                "Desc"  : "Focus movement among focusable and not focusable objects"
                                            ],
                                            [
                                                "Title" : "UIFocusGuide",
                                                "Desc"  : "Focus movement with UIFocusGuide"
                                            ]
                                        ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text       = items[indexPath.row]["Title"] as? String
        cell.detailTextLabel?.text = items[indexPath.row]["Desc"] as? String

        return cell
    }

    //MARK: - UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)


    }
}

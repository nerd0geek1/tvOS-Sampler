//
//  TopViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/23.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class TopViewController: UITableViewController {

    let items: [[String : String]] = [
                                        [
                                            "Title" : "Focus",
                                            "Storyboard" : "Focus"
                                        ],
                                        [
                                            "Title" : "Siri Remote",
                                            "Storyboard" : "SiriRemote"
                                        ]
                                    ]

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
        cell.textLabel?.text = items[indexPath.row]["Title"]

        return cell
    }

    //MARK: - UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let storyboardName: String = items[indexPath.row]["Storyboard"]!
        showSelectedMenu(storyboardName)
    }

    //MARK: - private

    private func showSelectedMenu(storyboardName: String) {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController: UIViewController = storyboard.instantiateInitialViewController()!

        navigationController?.pushViewController(viewController, animated: true)
    }
}

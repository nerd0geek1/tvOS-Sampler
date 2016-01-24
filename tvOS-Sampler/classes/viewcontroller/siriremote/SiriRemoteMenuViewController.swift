//
//  SiriRemoteMenuViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/24.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class SiriRemoteMenuViewController: UITableViewController {

    let items: [[String : AnyObject]] = [
                                            [
                                                "Title" : "Press Type",
                                                "Desc"  : "show available Press Type on Siri Remote",
                                                "Dest"  : "SiriRemotePressViewController"
                                            ],
                                            [
                                                "Title" : "DPad",
                                                "Desc"  : "show user touch position on Siri Remote DPad(Touch Surface)",
                                                "Dest"  : "SiriRemoteDPadViewController"
                                            ],
                                            [
                                                "Title" : "Motion",
                                                "Desc"  : "show Siri Remote motion censor values",
                                                "Dest"  : "SiriRemoteMotionViewController"
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

        let destinationName: String = items[indexPath.row]["Dest"] as! String
        showSelectedDestination(destinationName)
    }

    //MARK: - private

    private func showSelectedDestination(destinationName: String) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SiriRemote", bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier(destinationName)

        presentViewController(viewController, animated: true, completion: nil)
    }
}

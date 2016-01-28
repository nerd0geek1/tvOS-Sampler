//
//  BackgroundModesMenuViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/28.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class BackgroundModesMenuViewController: UITableViewController {

    let items: [[String : AnyObject]] = [
                                            [
                                                "Title" : "Audio Play",
                                                "Desc"  : "Play sample audio file in background",
                                                "Dest"  : "BackgroundModesAudioViewController"
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
        let storyboard: UIStoryboard = UIStoryboard(name: "BackgroundModes", bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier(destinationName)
        
        presentViewController(viewController, animated: true, completion: nil)
    }
}

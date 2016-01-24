//
//  SiriRemoteDPadViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/24.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit
import GameController

class SiriRemoteDPadViewController: UIViewController {

    var siriRemote: GCController!

    @IBOutlet weak var xValueLabel: UILabel!
    @IBOutlet weak var yValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for controller in GCController.controllers() {
            if siriRemote == nil {
                siriRemote = controller
                siriRemote.microGamepad?.dpad.valueChangedHandler = {[weak self] (DPad, xValue, yValue) in
                    self?.xValueLabel.text = "xValue: \(xValue)"
                    self?.yValueLabel.text = "yValue: \(yValue)"
                }
                break
            }
        }
    }
}

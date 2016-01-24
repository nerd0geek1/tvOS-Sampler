//
//  SiriRemoteMotionViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/24.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit
import GameController

class SiriRemoteMotionViewController: UIViewController {

    var siriRemote: GCController!

    @IBOutlet weak var userAccelerationXLabel: UILabel!
    @IBOutlet weak var userAccelerationYLabel: UILabel!
    @IBOutlet weak var userAccelerationZLabel: UILabel!
    @IBOutlet weak var gravityXLabel: UILabel!
    @IBOutlet weak var gravityYLabel: UILabel!
    @IBOutlet weak var gravityZLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        for controller in GCController.controllers() {
            if siriRemote == nil {
                siriRemote = controller
                siriRemote.motion?.valueChangedHandler = {[weak self] (motion) in
                    self?.userAccelerationXLabel.text = "userAcceleration.x: \(motion.userAcceleration.x)"
                    self?.userAccelerationYLabel.text = "userAcceleration.y: \(motion.userAcceleration.y)"
                    self?.userAccelerationZLabel.text = "userAcceleration.z: \(motion.userAcceleration.z)"

                    self?.gravityXLabel.text = "gravity.x: \(motion.gravity.x)"
                    self?.gravityYLabel.text = "gravity.y: \(motion.gravity.y)"
                    self?.gravityZLabel.text = "gravity.z: \(motion.gravity.z)"
                }
                break
            }
        }
    }
}

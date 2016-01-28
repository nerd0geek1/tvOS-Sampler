//
//  BackgroundModesAudioViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/28.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit


class BackgroundModesAudioViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        Player.sharedInstance.prepareForBackgroundMode()
        Player.sharedInstance.startPlaying()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        Player.sharedInstance.stopPlaying()
    }
}

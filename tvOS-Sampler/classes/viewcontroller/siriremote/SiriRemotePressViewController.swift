//
//  SiriRemotePressViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/24.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class SiriRemotePressViewController: UIViewController {

    @IBOutlet weak var pressTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        for item in presses {
            var typeString: String = ""
            
            switch item.type {
            case .Select:       typeString = "type: Select"
            case .Menu:         typeString = "type: Menu"
            case .PlayPause:    typeString = "type: PlayPause"
            default:            break
            }

            pressTypeLabel.text = typeString

            break
        }
    }
}

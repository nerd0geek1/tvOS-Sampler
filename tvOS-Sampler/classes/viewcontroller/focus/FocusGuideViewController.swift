//
//  FocusGuideViewController.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/23.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit

class FocusGuideViewController: UIViewController {

    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!

    private var focusGuide: UIFocusGuide!

    override func viewDidLoad() {
        super.viewDidLoad()

        focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)

        // Anchor the top left of the focus guide.
        focusGuide.leftAnchor.constraintEqualToAnchor(buttonB.leftAnchor).active = true
        focusGuide.topAnchor.constraintEqualToAnchor(buttonC.topAnchor).active = true

        // Anchor the width and height of the focus guide.
        focusGuide.widthAnchor.constraintEqualToAnchor(buttonB.widthAnchor).active = true
        focusGuide.heightAnchor.constraintEqualToAnchor(buttonC.heightAnchor).active = true
    }

    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)

        guard let nextFocusedView = context.nextFocusedView else { return }

        switch nextFocusedView {
        case buttonB:   focusGuide.preferredFocusedView = buttonC
        case buttonC:   focusGuide.preferredFocusedView = buttonB
        default:        focusGuide.preferredFocusedView = nil
        }
    }
}

//
//  Player.swift
//  tvOS-Sampler
//
//  Created by Kohei Tabata on 2016/01/28.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import UIKit
import AVFoundation

class Player: NSObject {

    static let sharedInstance: Player = Player()
    
    private let player: AVPlayer = AVPlayer()
    private var playerItem: AVPlayerItem?
    
    func prepareForBackgroundMode() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func startPlaying() {
        let url: NSURL = NSBundle.mainBundle().URLForResource("SampleAudio", withExtension: "mp3")!
        playerItem = AVPlayerItem(URL: url)
        
        player.replaceCurrentItemWithPlayerItem(playerItem)
        playerItem?.addObserver(self, forKeyPath: "status", options: .New, context: nil)
    }
    
    func stopPlaying() {
        player.pause()
        
        playerItem?.removeObserver(self, forKeyPath: "status")
    }
    
    //MARK: - KVO
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        player.play()
    }
}

//
//  LoginController.swift
//  CoverParallax
//
//  Created by Diep Nguyen Hoang on 7/24/15.
//  Copyright (c) 2015 CodenTrick. All rights reserved.
//

import UIKit
import AVFoundation

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("BackgroundVideo", ofType: "mp4")
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayerActionAtItemEnd.None;
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.insertSublayer(playerLayer, atIndex: 0)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd", name: AVPlayerItemDidPlayToEndTimeNotification, object: player!.currentItem)
        player!.seekToTime(kCMTimeZero)
        player!.play()
        
        usernameField.layer.cornerRadius = 4
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor.whiteColor().CGColor
        usernameField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        passwordField.layer.cornerRadius = 4
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.whiteColor().CGColor
        passwordField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        loginButton.backgroundColor = UIColor.whiteColor()
        loginButton.layer.cornerRadius = 4
        loginButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        self.view.addMotionEffect(group)
    }
    
    func playerItemDidReachEnd() {
        player!.seekToTime(kCMTimeZero)
    }
}

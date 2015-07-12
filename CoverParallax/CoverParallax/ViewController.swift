//
//  ViewController.swift
//  CoverParallax
//
//  Created by Diep Nguyen Hoang on 7/11/15.
//  Copyright (c) 2015 CodenTrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.layer.cornerRadius = 5.0
        avatar.layer.borderWidth = 4.0
        avatar.layer.borderColor = UIColor.whiteColor().CGColor
        avatar.clipsToBounds = true
    }
}


//
//  ViewController.swift
//  CoverParallax
//
//  Created by Diep Nguyen Hoang on 7/11/15.
//  Copyright (c) 2015 CodenTrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.layer.cornerRadius = 5.0
        avatar.layer.borderWidth = 4.0
        avatar.layer.borderColor = UIColor.whiteColor().CGColor
        avatar.clipsToBounds = true
        scrollView.delegate = self
        contentImageView.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("LoginScreen") {
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = self.scrollView.contentOffset.y * 0.2
        let availableOffset = min(yOffset, 60)
        let contentRectYOffset = availableOffset / contentImageView.frame.size.height
        contentImageView.layer.contentsRect = CGRectMake(0.0, contentRectYOffset, 1, 1);
    }
}

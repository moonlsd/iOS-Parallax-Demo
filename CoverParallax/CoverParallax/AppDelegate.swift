//
//  AppDelegate.swift
//  CoverParallax
//
//  Created by Diep Nguyen Hoang on 7/11/15.
//  Copyright (c) 2015 CodenTrick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        return true
    }
}


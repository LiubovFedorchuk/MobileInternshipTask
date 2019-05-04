//
//  AppDelegate.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import UIKit
import SwiftyBeaver

public let log = SwiftyBeaver.self
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
        log.addDestination(console)
        return true
    }
}


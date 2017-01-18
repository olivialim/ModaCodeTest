//
//  AppDelegate.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

@UIApplicationMain
//MARK: - App Lifecycle
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var rootViewController: UIViewController? {
        didSet {
            if let window = window {
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations:
                    {
                        window.rootViewController = self.rootViewController
                    }, completion: nil)
            }
            else {
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = rootViewController
                window?.backgroundColor = UIColor.white
                window?.makeKeyAndVisible()
            }
        }
    }
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.setupRootViewController()
        return true
    }
}


//MARK: - ViewController -
extension AppDelegate {
    
    func setupRootViewController() {
        let navigationController = UINavigationController(rootViewController: AllClothesController())
        navigationController.navigationBar.barTintColor = App.Color.lightPink()
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : App.Color.gold(),
            NSFontAttributeName : App.Font.ralewayBold(size: .Large)
        ]
        
        self.rootViewController = navigationController
    }
}


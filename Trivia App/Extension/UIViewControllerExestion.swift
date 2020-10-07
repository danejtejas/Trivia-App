//
//  UIViewControllerExestion.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit



extension UIViewController
{
    
    func  setRootVC ( vc : UIViewController)  {
        
        let nav = UINavigationController(rootViewController: vc )
        if #available(iOS 13, *)
        {
            let sceneDeleage = SceneDelegate.shared
            sceneDeleage!.window?.rootViewController = nav
            sceneDeleage?.window?.makeKeyAndVisible()
            
        }
        else
        {
            let appDel = UIApplication.shared.delegate as! AppDelegate
            appDel.window?.rootViewController = nav
            appDel.window?.makeKeyAndVisible()
        }
        
    }
    
    
    func setLightMode()
    {
        if #available(iOS 13, *)
        {
            overrideUserInterfaceStyle = .light
        }
        
    }
    
}

//
//  MyAlert.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit


extension UIAlertController
{
    
    static func showAlert( _ msg : String, vc : UIViewController)
    {
        let alertVC = UIAlertController(title: "Trivia", message: msg, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        vc.present(alertVC, animated: true, completion: nil)
        
        
    }
    
    
}
